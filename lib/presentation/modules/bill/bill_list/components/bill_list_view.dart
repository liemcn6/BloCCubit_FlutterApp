part of '../bill_list_screen.dart';

class BillListScreenView extends BaseWidget {
  const BillListScreenView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BillListCubit>().getInit(context: context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.background,
      body: Column(
        children: [
          _header(theme, t),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: RefreshIndicator.adaptive(
                onRefresh: () => context.read<BillListCubit>().getInit(context: context),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: BlocBuilder<BillListCubit, BillListState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          _filter(context, state, theme, t),
                          const SizedBox(height: 24),
                          LoadingWrapper(
                            isLoaded: state.isLoaded,
                            child: Column(
                              children: _listBill(theme, t, state.billList),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _listBill(AppTheme theme, AppLocalizations t, BillList billList) {
    return (billList.data.isEmpty)
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
        : billList.data.map<Widget>((item) => _listBillItem(theme, t, item)).toList();
  }

  _listBillItem(AppTheme theme, AppLocalizations t, BillListData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AppNavigator.push(Routes.billDetail, item.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    item.invoiceNumber,
                    style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
                  ),
                  const Spacer(),
                  Text(
                    StringUtils.formatStringToCash(cash: item.totalAmount),
                    style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    DateTimeUtils.convertDate(item.issuedDate),
                    style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
                  ),
                  const Spacer(),
                  CommonWidget.badge(t.bill_status(item.status), _getTextColor(theme, item.status),
                      _getBgColor(theme, item.status))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getTextColor(AppTheme theme, String text) {
    switch (text) {
      case 'UNPAID':
        return CommonWidget.badgeYellow(theme).textColor;
      case 'PAID_PARTIAL':
        return CommonWidget.badgeBlue(theme).textColor;
      case 'PAID':
        return CommonWidget.badgeGreen(theme).textColor;
      default:
        return CommonWidget.badgeDefault(theme).textColor;
    }
  }

  _getBgColor(AppTheme theme, String text) {
    switch (text) {
      case 'UNPAID':
        return CommonWidget.badgeYellow(theme).bgColor;
      case 'PAID_PARTIAL':
        return CommonWidget.badgeBlue(theme).bgColor;
      case 'PAID':
        return CommonWidget.badgeGreen(theme).bgColor;
      default:
        return CommonWidget.badgeDefault(theme).bgColor;
    }
  }

  _filter(BuildContext context, BillListState state, AppTheme theme, AppLocalizations t) {
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
      BuildContext context, BillListState state, AppTheme theme, AppLocalizations t, int type) {
    var value = '';
    if (type == 1 && state.building.name != null) {
      value = state.building.name ?? '';
    }
    if (type == 2) {
      value = state.billStatus.status ?? '';
    }
    var text = type == 1 ? '${t.building}: $value' : '${t.status}: $value';
    final cubit = context.watch<BillListCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        switch (type) {
          case 1:
            cubit.chooseBuilding(context);
            break;
          case 2:
            cubit.chooseStatus(context);
            break;
        }
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyle.s14w400cBlack.copyWith(color: theme.colors.neutral13),
            ),
            const Spacer(),
            AppSvgs.icChevronForward
          ],
        ),
      ),
    );
  }

  _header(AppTheme theme, AppLocalizations t) {
    return Stack(
      children: [
        const Image(
          image: AppImages.bgHeaderBill,
          fit: BoxFit.fitWidth,
        ),
        SafeArea(
          child: CommonWidget.iconBack323E44(),
        ),
        Positioned.fill(
          bottom: 24,
          left: 16,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              t.bill,
              style: AppTextStyle.s24w400cBlack.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
