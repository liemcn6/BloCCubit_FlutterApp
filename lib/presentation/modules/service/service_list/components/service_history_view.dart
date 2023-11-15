part of '../service_list_screen.dart';

class ServiceHistoryView extends StatelessWidget {
  final AppTheme theme;
  final AppLocalizations t;
  final ServiceListState state;

  const ServiceHistoryView({super.key, required this.theme, required this.t, required this.state});

  @override
  Widget build(BuildContext context) {
    return _serviceHistory(context, state, theme, t);
  }

  _serviceHistory(
      BuildContext context, ServiceListState state, AppTheme theme, AppLocalizations t) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _filter(context, state, theme, t),
          const SizedBox(height: 25),
          LoadingWrapper(
            isLoaded: state.isHistoryLoaded,
            child: Column(children: _serviceHistoryList(theme, t, state.serviceHistory)),
          ),
        ],
      ),
    );
  }

  _serviceHistoryList(AppTheme theme, AppLocalizations t, ServiceHistory serviceHistory) {
    return (serviceHistory.data.isEmpty)
        ? [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSvgs.icEmpty,
                const SizedBox(
                  height: 16,
                ),
                Text(t.noData, style: AppTextStyle.s16wBoldEmptyL),
              ],
            ),
          ]
        : serviceHistory.data.map<Widget>((item) => _serviceHistoryItem(theme, t, item)).toList();
  }

  _serviceHistoryItem(AppTheme theme, AppLocalizations t, ServiceHistoryData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AppNavigator.push(Routes.serviceHistoryDetail, {"id": item.id});
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.facilityName,
                      style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateTimeUtils.convertDate(item.registrationDate),
                      style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CommonWidget.badge(t.service_history_name(item.status.value),
                      _getTextColor(theme, item.status), _getBgColor(theme, item.status)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getTextColor(AppTheme theme, ServiceRegistrationStatus status) {
    switch (status) {
      case ServiceRegistrationStatus.waitApprove:
        return CommonWidget.badgeYellow(theme).textColor;
      case ServiceRegistrationStatus.waitCancel:
        return CommonWidget.badgeBlue(theme).textColor;
      case ServiceRegistrationStatus.approved:
        return CommonWidget.badgeGreen(theme).textColor;
      default:
        return CommonWidget.badgeDefault(theme).textColor;
    }
  }

  _getBgColor(AppTheme theme, ServiceRegistrationStatus status) {
    switch (status) {
      case ServiceRegistrationStatus.waitApprove:
        return CommonWidget.badgeYellow(theme).bgColor;
      case ServiceRegistrationStatus.waitCancel:
        return CommonWidget.badgeBlue(theme).bgColor;
      case ServiceRegistrationStatus.approved:
        return CommonWidget.badgeGreen(theme).bgColor;
      default:
        return CommonWidget.badgeDefault(theme).bgColor;
    }
  }

  _filter(BuildContext context, ServiceListState state, AppTheme theme, AppLocalizations t) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          _filterItem(context, state, theme, t, 1),
          const Divider(color: Color(0x08000000)),
          _filterItem(context, state, theme, t, 2),
        ],
      ),
    );
  }

  _filterItem(
      BuildContext context, ServiceListState state, AppTheme theme, AppLocalizations t, int type) {
    var text = '';
    switch (type) {
      case 1:
        var value = state.serviceHistoryType!.id != "" ? state.serviceHistoryType?.name : "";
        text = '${t.type_service}: $value';
        break;
      case 2:
        var value = (state.date == null || state.isTimeCleared == true)
            ? ''
            : DateTimeUtils.convertDate(state.date);
        text = '${t.days}: $value';
        break;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        switch (type) {
          case 1:
            context.read<ServiceListCubit>().chooseHistoryType(context);
            break;
          case 2:
            _chooseDate(context, t);
            break;
        }
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.s14w400cBlack.copyWith(color: theme.colors.neutral13),
              ),
            ),
            // const Spacer(),
            type == 1 ? AppSvgs.icChevronForward : AppSvgs.icCalendar
          ],
        ),
      ),
    );
  }

  void _chooseDate(BuildContext context, AppLocalizations t) async {
    showCalendarBottomSheet(
        context: context,
        currentDay: DateTime.now(),
        onChange: (DateTime data) {
          context.read<ServiceListCubit>().emitDate(data);
        },
        title: t.pickDate,
        firstDay: DateTime.now(),
        closeTitle: t.clear_filter,
        onCloseChange: (DateTime data) {
          context.read<ServiceListCubit>().clearDate();
        });
  }

  _tab(ServiceListCubit cubit, AppTheme theme, AppLocalizations t, ServiceScreenType tabType) {
    return GestureDetector(
      onTap: () => cubit.switchTab(tabType),
      behavior: HitTestBehavior.opaque,
      child: BlocBuilder<ServiceListCubit, ServiceListState>(
        builder: (context, state) {
          return Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: state.type == tabType ? theme.colors.green8 : Colors.white,
                ),
              ),
            ),
            child: Center(
              child: Text(
                tabType == ServiceScreenType.list ? t.list_of_services : t.booking_history,
                style: AppTextStyle.s14w400cBlack.copyWith(
                  fontWeight: FontWeight.w600,
                  color: state.type == tabType ? theme.colors.green8 : theme.colors.neutral13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
