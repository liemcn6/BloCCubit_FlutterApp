import 'package:flutter_svg/svg.dart';

class UploadTypeModel {
  UploadTypeModel({
    required this.icon,
    required this.title,
    required this.onPress,
  });

  SvgPicture icon;
  void Function() onPress;
  String title;
}
