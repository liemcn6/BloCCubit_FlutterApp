import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';

import '../../../../../domain/entities/service/service_history_type.dart';
import '../../../../widgets/bottom_sheet_widget.dart';
import '../../../../widgets/card_view.dart';

class _ListBottomSheet extends BaseWidget {
  final Future<List<ServiceHistoryTypeData>> data;
  final String title;
  final Function(ServiceHistoryTypeData)? onTap;
  final ServiceHistoryTypeData? selectItem;

  const _ListBottomSheet({
    required this.data,
    required this.title,
    required this.onTap,
    this.selectItem,
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
                          if (data[i].id != selectItem?.id) {
                            onTap?.call(data[i]);
                          } else {
                            onTap?.call(const ServiceHistoryTypeData());
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
                                  style: const TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                              // AppUtils.isNullOrEmpty(selectId)?
                              Visibility(
                                visible: data[i].id == selectItem?.id,
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

Future<void> showServiceTypeBottomSheet({
  required BuildContext context,
  required Future<List<ServiceHistoryTypeData>> data,
  required String title,
  required Function(ServiceHistoryTypeData)? onTap,
  ServiceHistoryTypeData? selectItem = const ServiceHistoryTypeData(id: "", name: ""),
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => _ListBottomSheet(
      data: data,
      title: title,
      onTap: onTap,
      selectItem: selectItem,
    ),
  );
}
