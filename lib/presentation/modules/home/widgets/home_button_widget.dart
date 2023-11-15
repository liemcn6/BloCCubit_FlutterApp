import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/home/models/home_model.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';

class HomeButtonWidget extends BaseWidget {
  final HomeModel value; // Child widget for custom inside

  const HomeButtonWidget({
    super.key,
    required this.value,
  });

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    return CardView(
      onTap: value.onPress,
      elevation: 0,
      color: theme.colors.white,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          // const SizedBox(height: 6),

          SizedBox(
            child: value.screenIc,
          ),
          const SizedBox(height: 10),
          Text(
            value.title ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.s14.copyWith(
              fontWeight: FontWeight.w400,
              color: theme.colors.neutralDark13,
            ),
          ),
        ],
      ),
    );
  }
}
