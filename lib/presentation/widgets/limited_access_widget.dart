import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class LimitedAccessWidget extends BaseWidget {
  final bool isAccessLimited;
  final Widget child;
  const LimitedAccessWidget({required this.child, required this.isAccessLimited, Key? key})
      : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final colors = appController.state.theme.colors;

    return isAccessLimited
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.limitedAccess.assetName,
                  width: 240,
                  height: 240,
                ),
                const SizedBox(height: 32),
                Text(
                  tr.limited_access,
                  style: AppTextStyle.s20w600.withColor(colors.neutral13),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    tr.limited_access_content,
                    style: AppTextStyle.s14w400.withColor(colors.neutral13),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : child;
  }
}
