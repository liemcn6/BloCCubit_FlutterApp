import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import 'bottom_sheet_widget.dart';
import 'card_view.dart';

class ListStringBottomSheet extends BaseWidget {
  final Future<List<String>> data;
  final String title;
  final Function(int)? onTap;
  final String? selectItem;

  const ListStringBottomSheet({
    required this.data,
    required this.title,
    required this.onTap,
    this.selectItem,
    super.key,
  });

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations t) {
    final theme = appController.state.theme;

    return BottomSheetWidget(
      title: title,
      showIconClose: true,
      iconCloseRight: true,
      child: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!;

            return Center(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: DeviceUtils.getHeight(context) / 4 * 3,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (var i = 0; i < data.length; i++)
                      CardView(
                        color: Colors.transparent,
                        radius: 0,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        onTap: () {
                          if (data[i] != selectItem) {
                            onTap?.call(i);
                          } else {
                            onTap?.call(-1);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
                          margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
                          decoration: BoxDecoration(
                            border: i == data.length - 1
                                ? null
                                : Border(
                                    bottom: BorderSide(width: 1, color: theme.colors.border),
                                  ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  data[i],
                                  style: const TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              // AppUtils.isNullOrEmpty(selectId)?
                              Visibility(
                                visible: data[i] == selectItem,
                                child: Icon(Icons.check, color: theme.colors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Future<void> showListStringBottomSheet({
  required BuildContext context,
  required Future<List<String>> data,
  required String title,
  required Function(int)? onTap,
  String? selectItem,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => ListStringBottomSheet(
      data: data,
      title: title,
      onTap: onTap,
      selectItem: selectItem,
    ),
  );
}
