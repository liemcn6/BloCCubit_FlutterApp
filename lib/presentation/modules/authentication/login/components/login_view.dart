part of '../login_screen.dart';

class LoginView extends BaseWidget {
  LoginView({Key? key}) : super(key: key);
  final languageList = AppLanguage.languageList();

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginCubit>().preCheckLogin();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final cubit = context.watch<LoginCubit>();
    final appState = appController.state;
    final theme = appState.theme;
    final state = cubit.state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          setStatusBarIconDark: true,
          visibleBack: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          isHideBackgroundImg: true,
          actions: [
            Container(
              width: 130,
              color: Colors.transparent,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  menuItemStyleData: MenuItemStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    customHeights: _getCustomItemsHeights(),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    width: 100,
                    maxHeight: 200,
                    offset: const Offset(Dimension.padding8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  customButton: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppLanguage.getLanguageByCode(t.localeName).flag ?? const SizedBox.shrink(),
                        const SizedBox(width: 4),
                        Text(
                          AppLanguage.getLanguageByCode(t.localeName).name ?? "",
                          style: AppTextStyle.s16w400cBlack,
                        ),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  items: langItems(languageList, theme: theme),
                  onChanged: (value) {
                    appController.onChangeLanguage(value!.locale);
                  },
                ),
              ),
            ),
          ],
          leadingWidget: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Dimension.padding16),
                child: Image.asset(
                  AppImages.appLogo.assetName,
                  height: 40,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImages.backgroundApp,
            fit: BoxFit.cover,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: DeviceUtils.getHeight(context),
            maxHeight: DeviceUtils.getHeight(context),
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Form(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: DeviceUtils.getHeight(context),
                      maxHeight: DeviceUtils.getHeight(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state.mode == LoginMode.half
                                  ? Padding(
                                      padding: const EdgeInsets.only(bottom: 32),
                                      child: Column(
                                        children: [
                                          ImgNetWork(
                                            url: state.avatar,
                                            fit: BoxFit.cover,
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(120)),
                                            width: 120,
                                            height: 120,
                                            color: theme.colors.white,
                                            blankImage: AppImages.blankAvatar.assetName,
                                          ),
                                          Text(
                                            t.hello,
                                            style: TextStyle(
                                              color: theme.colors.neutralDark13,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            state.fullName ?? "",
                                            style: TextStyle(
                                              color: theme.colors.neutralDark13,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          t.login,
                                          style: TextStyle(
                                            color: theme.colors.neutralDark13,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        const UserNameField(),
                                      ],
                                    ),

                              const PasswordField(),
                              const SizedBox(
                                height: 54,
                              ),
                              // _CheckBoxSaveLogin(),
                              const ButtonLogin(),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: Dimension.margin16,
                                  vertical: Dimension.margin20,
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () => {AppNavigator.push(Routes.forgotPassword)},
                                      child: Text(
                                        t.forgot_password,
                                        style: TextStyle(
                                          color: theme.colors.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          decorationColor: theme.colors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      // visible: Globals.appConfig.isEnabledCheckRegister ?? false,
                                      child: InkWell(
                                        onTap: () {
                                          if (state.mode == LoginMode.half) {
                                            cubit.changeToFullLoginMode();
                                            return;
                                          }

                                          AppNavigator.push(Routes.register);
                                        },
                                        child: Text(
                                          state.mode == LoginMode.half
                                              ? t.log_in_to_another_account
                                              : t.register,
                                          style: TextStyle(
                                            color: theme.colors.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            decorationColor: theme.colors.primary,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: FutureBuilder(
                        //       future: viewModel.getVersion(),
                        //       builder: (context, snapshot) {
                        //         if (snapshot.hasData) {
                        //           return Padding(
                        //             padding: const EdgeInsets.only(bottom: 16),
                        //             child: Center(
                        //               child: Text(
                        //                 '${lang.appVersion}: ${snapshot.data}',
                        //                 style: TextStyle(
                        //                   color: theme.appColors.white,
                        //                   fontSize: FontSize.pt14,
                        //                   fontWeight: FontWeight.w600,
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         }

                        //         return const SizedBox();
                        //       }),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<AppLanguage>> langItems(List<AppLanguage> items,
      {required AppTheme theme}) {
    List<DropdownMenuItem<AppLanguage>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<AppLanguage>(
            value: item,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimension.padding12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item.flag ?? const SizedBox.shrink(),
                  const SizedBox(width: 4),
                  Text(
                    item.name ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: theme.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<AppLanguage>(
              enabled: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.padding12),
                child: Divider(),
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (languageList.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }
}
