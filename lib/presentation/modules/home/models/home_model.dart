import 'package:flutter/material.dart';
import 'package:home_care/presentation/modules/home/models/enum/home_type.dart';

class HomeModel {
  Widget screenIc;
  String? title;
  String? subTitle;
  dynamic value;
  String? valueType;
  HomeType? type;
  void Function() onPress;

  HomeModel({
    required this.screenIc,
    this.type,
    this.subTitle,
    this.title,
    this.value,
    this.valueType = HomeValueType.number,
    required this.onPress,
  });
}
