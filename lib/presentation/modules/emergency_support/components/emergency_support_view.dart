import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/presentation/modules/emergency_support/cubit/emergency_support_cubit.dart';
import 'package:home_care/presentation/modules/emergency_support/widgets/hotline_item.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class EmergencySupportView extends BaseWidget {
  const EmergencySupportView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmergencySupportCubit>().getHotlines();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final cubit = context.watch<EmergencySupportCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: t.phone_list,
          // visibleBack: false,
          actions: const [
            IconHome(),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: theme.colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(16),
            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: cubit.state.hotlines
            //       .map((e) => HotlineItem(
            //             item: e,
            //             isLastItem: cubit.state.hotlines.last == e,
            //           ))
            //       .toList(),
            // ),
            child: ListWidget(
              itemCount: cubit.state.hotlines.length,
              itemBuilder: (context, idx) => HotlineItem(
                item: cubit.state.hotlines[idx],
                isLastItem: cubit.state.hotlines.last == cubit.state.hotlines[idx],
              ),
            ),
          );
        },
      ),
    );
  }
}
