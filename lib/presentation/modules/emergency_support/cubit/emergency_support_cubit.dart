import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/emergency_support/hotline.dart';
import 'package:home_care/domain/usecases/emergency_support/emergency_support_usecase.dart';

part 'emergency_support_state.dart';

class EmergencySupportCubit extends Cubit<EmergencySupportState> {
  final _usecase = getIt.get<EmergencySupportUseCase>();
  EmergencySupportCubit() : super(const EmergencySupportInitial());

  Future<void> getHotlines() async {
    final hotlines = await _usecase.getHotlines();
    emit(state.copyWith(hotlines: hotlines));
  }
}
