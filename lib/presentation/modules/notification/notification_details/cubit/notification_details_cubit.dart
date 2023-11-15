import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/notification/notification_useccase.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';

part 'notification_details_state.dart';

class NotificationDetailsCubit extends Cubit<NotificationDetailsState> {
  NotificationDetailsCubit() : super(NotificationDetailsInitial());

  final _useCase = getIt.get<NotificationUseCase>();

  Future<void> requestDetailNotification(String? eventId) async {
    NotificationModel notificationDetails = await _useCase.requestDetailNotification(eventId);
    emit(state.copyWith(dataDetailNotification: notificationDetails));
  }
}
