import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/notification/notification_useccase.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_content_model.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';

part 'notification_main_state.dart';

class NotificationMainCubit extends Cubit<NotificationMainState> {
  NotificationMainCubit() : super(NotificationMainInitial());

  final _useCase = getIt.get<NotificationUseCase>();

  List<NotificationModel> listNotification = [];
  List<NotificationModel> newList = [];

  bool enableLoadMore = false;
  int page = 1;

  Future<void> requestNotification() async {
    listNotification = await _useCase.requestNotification(state.pagesize, page);
    enableLoadMore = true;

    if (listNotification.isEmpty) {
      enableLoadMore = false;
    } else {
      if (state.page == 1) {
        enableLoadMore = true;
        page = 1;
        if (state.listNotification.length < state.pagesize) {
          enableLoadMore = false;
          newList.addAll(state.listNotification + listNotification);
        }
      } else {}
    }

    emit(state.copyWith(
        listNotification:
            (state.listNotification.length < state.pagesize) ? newList : listNotification,
        enableLoadMore: enableLoadMore));
  }

  Future<void> onRefresh() async {
    page = 1;
    await requestNotification();
  }

  Future onLoadMore() async {
    if (enableLoadMore) {
      page++;
      enableLoadMore = false;
      await requestNotification();
    }
  }

  Future<void> handleOnDelete(context, id, index, theme) async {
    final t = Utils.languageOf(context);
    showDialog(
      context: context,
      builder: (context) {
        return DialogCustom(
          title: t.deleteConfirmation,
          content: t.deleteThisMessage,
          textBtnAccept: t.agree,
          colorButtonAccept: theme.colors.red,
          textBtnCancel: t.cancel,
          showBtnCancel: true,
          onPressBtnCancel: () {
            Navigator.of(context).pop();
          },
          onPressBtnAccept: () async {
            await _useCase.requestDeleteNotification(id, index);
            await requestNotification();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  // Future<void> requestCountUnread() async {
  //   if (isClosed) return;
  //   int countUnread = await _useCase.requestCountUnread();
  //   emit(state.copyWith(countUnread: countUnread));
  // }

  //add navigation to notification if the feature is added
  //when navigate to another screen call readNotification
  Future<void> onPressItem(NotificationModel item, int index) async {
    if (item.isRead ?? false) {
    } else {
      //read notification
      await _useCase.requestReadNotification(item.id);

      var list = state.listNotification;
      list[index].isRead = true;
      emit(state.copyWith(listNotification: list));
    }

    // // request count unread
    // await _useCase.requestCountUnread();

    //navigate to html notification
    if (item.contentType == 'HTML') {
      AppNavigator.push(Routes.notificationDetails, item.eventId);
    } else {
      final parsedJson = jsonDecode(item.content ?? '');
      final restaurant = NotificationContentModel.fromJson(parsedJson);
      //navigate to feature notification
      if (restaurant.dataType == 'TICKET') {
      } else if (restaurant.dataType == 'COMPLAINT') {
      }
      //complain notification
      else if (restaurant.dataType == 'SURVEY') {
      }
      //incident notification
      else if (restaurant.dataType == 'INCIDENT') {
      }
      //task notification
      else if (restaurant.dataType == 'TASK') {
      }
      //shift transfer notification
      else if (restaurant.dataType == 'SHIFT_TRANSFER') {
      }
      //swap application notification
      else if (restaurant.dataType == 'SWAP_APPLICATION') {
      }
      //view my shift notification
      else if (restaurant.dataType == 'MY_SHIFT') {
      }
      //view overtime registration notification
      else if (restaurant.dataType == 'OT_REGISTRATION') {
      }
      //view overtime registration schedule
      else if (restaurant.dataType == "OT_REGISTRATION_SCHEDULE") {
      }
      //view cleaning attendance notification
      else if (restaurant.dataType == "CLEANING_ATTENDANCE") {
      }
      //view security attendance notification
      else if (restaurant.dataType == "SECURITY_ATTENDANCE") {
      }
      //else navigate here
      else {}
    }
  }
}
