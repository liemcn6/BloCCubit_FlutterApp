import 'package:flutter/material.dart';

class HrWidget extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? heightDivider;
  final double? indent;
  final double? endIndent;
  final EdgeInsets? margin;

  const HrWidget({
    super.key,
    this.color,
    this.thickness,
    this.heightDivider,
    this.indent,
    this.endIndent,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: color ?? const Color(0xFFE0E0E0),
              height: heightDivider ?? 1,
              thickness: thickness ?? 1,
              indent: indent,
              endIndent: endIndent,
            ),
          ),
        ],
      ),
    );
  }
}
