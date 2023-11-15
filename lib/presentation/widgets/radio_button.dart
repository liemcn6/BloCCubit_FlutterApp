import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';

// ignore: must_be_immutable
class RadioButton<T> extends StatefulWidget {
  /// title of check box
  String title;

  TextStyle? titleStyle;

  /// Decoration container parent, such as border, color...
  final Decoration? decoration;

  /// padding of list
  final EdgeInsetsGeometry? padding;

  /// margin of list
  final EdgeInsetsGeometry? margin;

  /// visibility
  bool visibility;

  /// value
  T value;

  bool? isSelected;

  /// value
  void Function(bool isSelected, T value) onChange;

  BoxShape shape;

  RadioButton({
    super.key,
    required this.value,
    this.isSelected,
    required this.onChange,
    this.decoration,
    this.padding,
    this.margin,
    this.shape = BoxShape.rectangle,
    this.title = "",
    this.visibility = true,
    this.titleStyle = const TextStyle(
      color: Color(0xff323E44),
      fontSize: 14,
    ),
  });

  @override
  State<RadioButton<T>> createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>> {
  bool checked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        checked = widget.isSelected ?? false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RadioButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      checked = widget.isSelected ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final appColors = controller.state.theme.colors;
    return Visibility(
      visible: widget.visibility,
      child: Container(
        margin: widget.margin,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              widget.onChange(!checked, widget.value);
              // setState(() {
              //   checked = !checked;
              // });
            },
            child: Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.shape == BoxShape.rectangle
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: checked ? appColors.primary : const Color(0xFFCECECE),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            size: 18,
                            color: checked ? appColors.primary : Colors.transparent,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: appColors.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: checked ? appColors.primary : Colors.transparent,
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
