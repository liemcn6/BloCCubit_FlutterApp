import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_care/configs.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/app_cubit/app_state.dart';

import 'core/core.dart';
import 'di.dart';
import 'firebase_options.dart';
import 'presentation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets', 'fonts'], license);
  });
  await DependencyInjection.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingConfig.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: const AppMobile(),
    );
  }
}

class AppMobile extends StatefulWidget {
  const AppMobile({super.key});

  @override
  State<AppMobile> createState() => _AppMobileState();
}

class _AppMobileState extends State<AppMobile> {
  late AppCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<AppCubit>();
    super.initState();
    _cubit.getLanguage();
    _cubit.configLoading();
    // _cubit.requestCountUnread();
    FirebaseMessagingConfig.setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      bloc: _cubit,
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        return MaterialApp(
          color: Colors.white,
          title: 'Home Care',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: state.themeMode == AppThemeMode.light ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
          builder: EasyLoading.init(),
          locale: state.locale,
        );
      },
    );
  }
}
