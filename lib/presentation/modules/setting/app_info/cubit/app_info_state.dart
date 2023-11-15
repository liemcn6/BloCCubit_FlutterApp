part of 'app_info_cubit.dart';

class AppInfoState extends Equatable {
  final String appVersion;

  const AppInfoState({
    required this.appVersion,
  });

  @override
  List<Object> get props => [appVersion];

  AppInfoState copyWith({
    String? appVersion,
  }) {
    return AppInfoState(
      appVersion: appVersion ?? this.appVersion,
    );
  }
}

final class AppInfoInitial extends AppInfoState {
  const AppInfoInitial()
      : super(
          appVersion: "",
        );
}
