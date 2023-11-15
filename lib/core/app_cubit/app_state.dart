import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

enum AppThemeMode { light, dark }

@immutable
class AppState extends Equatable {
  final AppThemeMode themeMode;
  final AppTheme theme;
  final Locale? locale;
  final int? countUnread;

  const AppState({
    required this.themeMode,
    required this.theme,
    this.locale,
    this.countUnread,
  });

  @override
  List<Object?> get props => [
        themeMode,
        theme,
        locale,
        countUnread,
      ];

  AppState copyWith({
    AppThemeMode? themeMode,
    AppTheme? theme,
    Locale? locale,
    int? countUnread,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      countUnread: countUnread ?? this.countUnread,
    );
  }
}

final class AppInitial extends AppState {
  const AppInitial()
      : super(
          themeMode: AppThemeMode.light,
          theme: const AppTheme(AppThemeMode.light),
          countUnread: 0,
        );
}
