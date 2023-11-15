import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import 'bottom_sheet_widget.dart';
import 'card_view.dart';

class ListBottomSheet<T> extends BaseWidget {
  final Future<List<RowItem<T>>> data;
  final String title;
  final Function(RowItem<T>)? onTap;
  final RowItem<T>? selectItem;

  const ListBottomSheet({
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
                          if (data[i].isDisabled == true) {
                            return;
                          }

                          if (data[i].id != selectItem?.id) {
                            onTap?.call(data[i]);
                          } else {
                            onTap?.call(const RowItem());
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
                                  data[i].name ?? '- -',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: data[i].isDisabled == true
                                        ? theme.colors.neutral6
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              // AppUtils.isNullOrEmpty(selectId)?
                              Visibility(
                                visible: data[i].id == selectItem?.id && data[i].isDisabled != true,
                                child: Icon(Icons.check, color: theme.colors.primary),
                              ),
                              Visibility(
                                  visible: data[i].isDisabled == true,
                                  child: Text(
                                    data[i].disabledReason ?? '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: theme.colors.error,
                                    ),
                                  )),
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

Future<void> showListBottomSheet<T>({
  required BuildContext context,
  required Future<List<RowItem<T>>> data,
  required String title,
  required Function(RowItem<T>)? onTap,
  RowItem<T>? selectItem,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => ListBottomSheet<T>(
      data: data,
      title: title,
      onTap: onTap,
      selectItem: selectItem,
    ),
  );
}
