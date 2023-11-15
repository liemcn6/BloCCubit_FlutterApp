import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

class CheckboxCustom extends StatefulWidget {
  /// title of check box
  final String title;

  final TextStyle? titleStyle;

  /// Decoration container parent, such as border, color...
  final Decoration? decoration;

  /// padding of list
  final EdgeInsetsGeometry? padding;

  /// margin of list
  final EdgeInsetsGeometry? margin;

  /// visibility
  final bool visibility;

  /// value
  final bool value;

  /// value
  final void Function(bool newValue) onChange;

  final BoxShape shape;

  final Color checkedBorderColor;

  final Color unCheckedBorderColor;

  final double size;

  final double borderRadius;

  const CheckboxCustom(
      {super.key,
      required this.value,
      required this.onChange,
      this.decoration,
      this.padding,
      this.margin,
      this.shape = BoxShape.rectangle,
      this.title = "",
      this.visibility = true,
      this.titleStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
      this.checkedBorderColor = const Color(0xff39A07C),
      this.unCheckedBorderColor = const Color(0xff39A07C),
      this.size = 18,
      this.borderRadius = 4});

  @override
  CheckboxCustomState createState() => CheckboxCustomState();
}

class CheckboxCustomState extends State<CheckboxCustom> {
  var checked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        checked = widget.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CheckboxCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      checked = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visibility,
      child: Container(
        margin: widget.margin,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          child: GestureDetector(
            onTap: () {
              widget.onChange(!checked);
              // setState(() {
              //   checked = !checked;
              // });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: widget.padding ?? EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.shape == BoxShape.rectangle
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color:
                                  checked ? widget.checkedBorderColor : widget.unCheckedBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(widget.borderRadius),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            size: widget.size,
                            color: checked ? widget.checkedBorderColor : Colors.transparent,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(widget.size / 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff39A07C),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Container(
                            width: widget.size - 6,
                            height: widget.size - 6,
                            decoration: BoxDecoration(
                              color: checked ? const Color(0xff39A07C) : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                  Utils.isNullOrEmpty(widget.title)
                      ? const Offstage()
                      : const SizedBox(
                          width: 10,
                        ),
                  Utils.isNullOrEmpty(widget.title)
                      ? const Offstage()
                      : Text(
                          widget.title,
                          style: widget.titleStyle,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
