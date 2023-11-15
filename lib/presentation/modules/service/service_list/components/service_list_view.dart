part of '../service_list_screen.dart';

class ServiceListView extends BaseWidget {
  const ServiceListView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServiceListCubit>().getInit(context: context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ServiceListCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Column(
        children: [
          _header(theme, t),
          Row(
            children: [
              Expanded(flex: 1, child: _tab(cubit, theme, t, ServiceScreenType.list)),
              Expanded(flex: 1, child: _tab(cubit, theme, t, ServiceScreenType.history)),
            ],
          ),
          BlocBuilder<ServiceListCubit, ServiceListState>(
            builder: (context, state) => Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LoadingWrapper(
                    isLoaded: state.isListLoaded,
                    child: state.type == ServiceScreenType.list
                        ? ServiceCategoryView(theme: theme, t: t, state: state)
                        : ServiceHistoryView(theme: theme, t: t, state: state),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: AppStorage().authorities.permissions?.isBookingServiceCreate ?? false,
        child: FloatingActionButtonWidget(
            theme: theme,
            onTap: () async {
              bool result = await AppNavigator.push(Routes.serviceRegistration);
              if (result) {
                cubit.checkReloadHistory();
              }
            }),
      ),
    );
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

  _header(AppTheme theme, AppLocalizations t) {
    return Stack(
      children: [
        const Image(
          image: AppImages.bgHeaderService,
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
              t.utility_services,
              style: AppTextStyle.s24w400cBlack
                  .copyWith(fontWeight: FontWeight.w600, color: theme.colors.neutral13),
            ),
          ),
        )
      ],
    );
  }
}
