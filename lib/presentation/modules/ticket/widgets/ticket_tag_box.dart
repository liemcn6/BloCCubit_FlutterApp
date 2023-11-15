import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/ticket/issue_link_response.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

class TicketTagBox extends BaseWidget {
  final List<IssueLinkResponse> data;
  final Function(String ticketId)? onTagTap;

  const TicketTagBox({required this.data, required this.onTagTap, Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;
    final colors = theme.colors;

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 1 / 0.36,
      shrinkWrap: true,
      children: [
        if (data != null)
          ...data.map((e) {
            return renderTag(
              e.code ?? '',
              e.id ?? '',
              appColors: colors,
            );
          }).toList(),
      ],
    );
  }

  GestureDetector renderTag(
    String value,
    String ticketId, {
    required AppColors appColors,
  }) {
    return GestureDetector(
      onTap: () {
        onTagTap?.call(ticketId);
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appColors.gray300),
        ),
        child: Center(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: appColors.blue,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
