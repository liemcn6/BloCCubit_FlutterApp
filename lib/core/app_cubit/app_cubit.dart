import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_care/core/app_cubit/app_state.dart';
import 'package:home_care/core/app_language.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/domain/usecases/notification/notification_useccase.dart';
import 'package:home_care/presentation/widgets/brand_loading.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());

  final _notiUseCase = getIt.get<NotificationUseCase>();

  Future getLanguage() async {
    var languageLocal = await AppSP.get(AppSP.languageLocale);
    if (!Utils.isNullOrEmpty(languageLocal)) {
      emit(state.copyWith(locale: Locale(languageLocal)));
      onChangeLanguage(Locale(languageLocal));
    } else {
      onChangeLanguage(LanguageType.vietnamese.locale);
    }
  }

  void changeThemeMode(AppThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void switchThemeMode() {
    if (state.themeMode == AppThemeMode.light) {
      emit(state.copyWith(
        themeMode: AppThemeMode.dark,
        theme: const AppTheme(AppThemeMode.dark),
      ));
    } else {
      emit(state.copyWith(
        themeMode: AppThemeMode.light,
        theme: const AppTheme(AppThemeMode.light),
      ));
    }
  }

  /// Change Language
  Future<void> onChangeLanguage(Locale? lang) async {
    await AppSP.remove(AppSP.languageLocale);
    await AppSP.set(AppSP.languageLocale, lang?.languageCode);
    AppStorage().setCurrentLanguage(lang?.languageCode ?? 'vi');
    emit(state.copyWith(locale: lang));
  }

  void configLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..radius = 10
      ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
      ..indicatorColor = Colors.transparent
      ..userInteractions = false
      ..indicatorWidget = const BrandLoading(
        logoDark: false,
      )
      ..boxShadow = <BoxShadow>[]
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.custom
      ..dismissOnTap = false;
  }

  Future<void> requestCountUnread() async {
    int countUnread = await _notiUseCase.requestCountUnread();
    emit(state.copyWith(countUnread: countUnread));
  }
}
