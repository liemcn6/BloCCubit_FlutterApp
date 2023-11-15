import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemBTSheet extends StatelessWidget {
  const ItemBTSheet({super.key, this.icon, this.title, required this.onPress, required this.index});
  final SvgPicture? icon;
  final String? title;
  final void Function() onPress;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: index == 0 ? 0 : 1, color: const Color(0xffD8D8D8)))),
        height: 65,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: icon,
            ),
            Text(
              title ?? '',
              style: const TextStyle(color: Color(0xff212121), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
