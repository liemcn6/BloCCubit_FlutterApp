import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/usecases/profile/profile_usecase.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(const ProfileInfoInitial());

  final profileUseCase = getIt.get<ProfileUseCase>();

  Future<void> getInit({required BuildContext context}) async {
    await checkNetwork(context);
    final userProfile = await AppSecureStorage.getProfile();

    if (userProfile != null) {
      emit(state.copyWith(userProfile: userProfile));
    }
  }

  Future<void> checkNetwork(context) async {
    final t = Utils.languageOf(context);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } on SocketException catch (_) {
      WidgetUtils.showError(context: context, errorText: t.network_not_available);
    }
  }
}
