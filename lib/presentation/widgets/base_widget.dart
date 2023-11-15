import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({
    Key? key,
  }) : super(key: key);

  @protected
  Widget builder(
    BuildContext context,
    dynamic initData,
    AppCubit appController,
    AppLocalizations tr,
  );

  dynamic onInit(BuildContext context) => null;
  void onDispose(BuildContext context) {}

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  dynamic data;

  @override
  void initState() {
    data = widget.onInit(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final t = Utils.languageOf(context);
    return widget.builder(context, data, controller, t);
  }

  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }
}
