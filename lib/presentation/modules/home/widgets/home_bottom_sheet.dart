import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/home/cubit/home_cubit.dart';
import 'package:home_care/presentation/modules/home/models/home_model.dart';
import 'package:home_care/presentation/modules/home/widgets/home_button_widget.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(notifyParent),
      child: const HomeBottomSheetChild(),
    );
  }
}

notifyParent() {}

class HomeBottomSheetChild extends BaseWidget {
  const HomeBottomSheetChild({
    super.key,
  });
  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getInitBottomSheet(context: context);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final homeCubit = context.watch<HomeCubit>();

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Dimension.padding12),
          topRight: Radius.circular(Dimension.padding12),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: theme.colors.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Dimension.padding12),
                topRight: Radius.circular(Dimension.padding12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: Dimension.padding48,
                ),
                Expanded(
                  child: Text(
                    t.features,
                    style: AppTextStyle.s16w400cWhite.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                CardView(
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      // width: 48.0, // Set the desired width
                      height: 48.0, // Set the desired height
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            theme.colors.white, BlendMode.srcIn), // Change the color to red
                        child: AppSvgs.icClose,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 19 / 20,
                children: List.generate(homeCubit.state.listScreen.length, (index) {
                  if (homeCubit.state.listScreen.isNotEmpty &&
                      index < homeCubit.state.listScreen.length) {
                    HomeModel value = homeCubit.state.listScreen[index];
                    return HomeButtonWidget(
                      value: value,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
