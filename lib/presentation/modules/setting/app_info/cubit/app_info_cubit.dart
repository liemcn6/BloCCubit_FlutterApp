import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_info_state.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit() : super(const AppInfoInitial());

  void getAppVersion() async {
    // WidgetsFlutterBinding.ensureInitialized();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    emit(state.copyWith(appVersion: version));
  }
}
