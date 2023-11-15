part of '../settings_screen.dart';

class SettingsScreenView extends BaseWidget {
  const SettingsScreenView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingCubit>().getInit(context: context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<SettingCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.personal_information,
            visibleBack: false,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimension.padding16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
              child: Center(
                child: ImgNetWork(
                  url: cubit.state.userProfile.avatarFileUrl,
                  blankImage: AppImages.blankAvatar.assetName,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  width: 100,
                  height: 100,
                ),
              ),
            ),

            RichText(
              text: TextSpan(
                text: t.hello,
                style: AppTextStyle.s16w400cBlack
                    .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: cubit.state.userProfile.fullName,
                    style: AppTextStyle.s16w400cBlack.copyWith(
                      color: theme.colors.textTitle,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimension.padding24,
            ),
            //profiles
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      t.profile,
                      style: AppTextStyle.s16w400cBlack.copyWith(
                        color: theme.colors.textTitle,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: Dimension.margin16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ItemView(
                        title: t.personal_information,
                        icon: AppSvgs.icProfile,
                        onTap: () {
                          AppNavigator.push(Routes.profileInfo);
                        },
                      ),
                      ItemView(
                        // visible: profileInfo?.accountType == AccountType.customer &&
                        //     profileInfo?.authenticationType == AuthenticationType.internal,
                        title: t.change_pw,
                        icon: AppSvgs.icChangePw,
                        onTap: () {
                          AppNavigator.push(Routes.changePassword);
                        },
                      ),
                      //it doesn't have feature so comment temporary
                      // ItemView(
                      //   title: t.family_info,
                      //   icon: Padding(
                      //     padding: const EdgeInsets.only(right: Dimension.padding6),
                      //     child: SizedBox(height: 24, child: AppSvgs.icFamily),
                      //   ),
                      // ),
                      // ItemView(
                      //   title: t.tag_management,
                      //   icon: Padding(
                      //     padding: const EdgeInsets.only(right: Dimension.padding6),
                      //     child: SizedBox(height: 24, child: AppSvgs.icTag),
                      //   ),
                      // ),
                      ItemView(
                          // visible: (Globals.appConfig.isEnabledSelfInactive == true &&
                          //     profileInfo?.authenticationType == AuthenticationType.internal),
                          dividerVisible: false,
                          title: t.deleteAccount,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: Dimension.padding6),
                            child: SizedBox(height: 24, child: AppSvgs.icDeletePrimary),
                          ),
                          onTap: () {
                            cubit.handleRemoveAccount(context, theme, t);
                          }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Dimension.margin24,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  t.general_settings,
                  style: TextStyle(
                    color: theme.colors.textTitle,
                    fontSize: 16,
                    // fontFamily: FontFamily.roboto,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: Dimension.margin16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ItemView(
                    title: t.language,
                    icon: SizedBox(
                      height: 24,
                      child: AppSvgs.icLanguage,
                    ),
                    onTap: () => AppNavigator.push(Routes.languageScreen),
                  ),
                  Visibility(
                    visible: cubit.state.canUseBiometric,
                    child: Column(
                      children: [
                        ItemView(
                          title: Platform.isIOS ? t.use_face_id : t.use_fingerprint,
                          icon: Platform.isIOS
                              ? AppSvgs.icFaceId
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: Dimension.padding4),
                                  child: Icon(
                                    Icons.fingerprint,
                                    size: 24,
                                    color: theme.colors.primary,
                                  ),
                                ),
                          rightIcon: SizedBox(
                            height: 26,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: CupertinoSwitch(
                                value: cubit.state.biometricAuthenticate,
                                onChanged: (val) {
                                  //login feature, not done yet
                                  cubit.toggleAuthentication(t);
                                },
                                activeColor: theme.colors.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemView(
                      title: t.app_information,
                      icon: SizedBox(
                        height: 24,
                        child: AppSvgs.icInformation,
                      ),
                      onTap: () {
                        AppNavigator.push(Routes.appInfo);
                      }),
                  ItemView(
                    title: t.log_out,
                    icon: SizedBox(
                      height: 24,
                      child: AppSvgs.icSignOut,
                    ),
                    dividerVisible: false,
                    onTap: () {
                      cubit.handleSignOut(context, t, theme);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
