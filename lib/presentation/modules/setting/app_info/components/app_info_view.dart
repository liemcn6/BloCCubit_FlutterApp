part of '../app_info_screen.dart';

class AppInfoView extends BaseWidget {
  const AppInfoView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppInfoCubit>().getAppVersion();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<AppInfoCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.app_information,
          )),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: Dimension.padding54),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AppImages.backgroundApp,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(children: <Widget>[
              const SizedBox(
                height: Dimension.padding115,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.mainAppLogo.assetName,
                  width: 240,
                  height: 240,
                ),
              ),
              Text(
                "${t.app_version}${cubit.state.appVersion}",
              ),
              Container(
                margin: const EdgeInsets.all(
                  Dimension.padding24,
                ),
                // padding: const EdgeInsets.symmetric(horizontal: Dimensions.h54),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: launchToHomePageQLTN,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimension.padding24, horizontal: Dimension.padding16),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                t.website,
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: Dimension.margin24,
                              ),
                              const Expanded(
                                child: Text(
                                  'https://opencity.evotek.vn',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Divider(
                      color: theme.colors.gray600,
                      height: 1.0,
                    ),
                    InkWell(
                      onTap: () {
                        AppNavigator.push(Routes.privacyPolicy);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimension.padding24, horizontal: Dimension.padding16),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              t.terms_of_use,
                              style:
                                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: Dimension.margin24,
                            ),
                            Expanded(
                              child: Text(
                                t.terms_of_use,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void launchToHomePageQLTN() {
    final url = Uri.https('opencity.evotek.vn', '');
    launchUrl(url);
  }
}
