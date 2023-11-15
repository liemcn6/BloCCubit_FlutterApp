import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';

import 'bottom_sheet_widget.dart';
import 'card_view.dart';

class MultiSelectListBottomSheet extends StatefulWidget {
  final Future<List<RowItem>> data;
  final String title;
  final Function(List<RowItem>)? onMultiSelect;
  final List<RowItem>? selectedItems;

  const MultiSelectListBottomSheet({
    super.key,
    required this.data,
    required this.title,
    required this.onMultiSelect,
    this.selectedItems,
  });

  @override
  State<MultiSelectListBottomSheet> createState() => _MultiSelectListBottomSheetState();
}

class _MultiSelectListBottomSheetState extends State<MultiSelectListBottomSheet> {
  List<RowItem> _selectedItems = [];

  @override
  void initState() {
    _selectedItems = widget.selectedItems ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    // final t = Utils.languageOf(context);
    final theme = controller.state.theme;

    return BottomSheetWidget(
      title: widget.title,
      showIconClose: true,
      iconCloseRight: true,
      child: FutureBuilder(
          future: widget.data,
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
                          final List<RowItem> newSelectedItems = List.from(_selectedItems);

                          if (newSelectedItems.contains(data[i])) {
                            newSelectedItems.remove(data[i]);
                          } else {
                            newSelectedItems.add(data[i]);
                          }

                          widget.onMultiSelect?.call(newSelectedItems);
                          setState(() {
                            _selectedItems = newSelectedItems;
                          });
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
                              Visibility(
                                visible: _selectedItems.contains(data[i]),
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

// class MultiSelectListBottomSheet extends BaseWidget {
//   const MultiSelectListBottomSheet({
//     super.key,
//   });

//   @override
//   Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations t) {
//     final theme = appController.state.theme;

//     return BottomSheetWidget(
//       title: titleLarge,
//       showIconClose: true,
//       iconCloseRight: true,
//       child: FutureBuilder(
//           future: data,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(child: CircularProgressIndicator());
//             }

//             final data = snapshot.data!;

//             return Center(
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxHeight: DeviceUtils.getHeight(context) / 4 * 3,
//                 ),
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: [
//                     for (var i = 0; i < data.length; i++)
//                       CardView(
//                         color: Colors.transparent,
//                         radius: 0,
//                         alignment: Alignment.centerLeft,
//                         margin: EdgeInsets.zero,
//                         padding: EdgeInsets.zero,
//                         onTap: () {
//                           final List<RowItem> newSelectedItems = List.from(selectedItems ?? []);

//                           if (newSelectedItems.contains(data[i])) {
//                             newSelectedItems.remove(data[i]);
//                           } else {
//                             newSelectedItems.add(data[i]);
//                           }

//                           onMultiSelect?.call(newSelectedItems);
//                           // Don't pop the context here; keep the bottom sheet open
//                           setState(() {});
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
//                           margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
//                           decoration: BoxDecoration(
//                             border: i == data.length - 1
//                                 ? null
//                                 : Border(
//                                     bottom: BorderSide(width: 1, color: theme.colors.border),
//                                   ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   data[i].name ?? '- -',
//                                   style: const TextStyle(fontSize: 16, color: Colors.black),
//                                 ),
//                               ),
//                               Visibility(
//                                 visible: selectedItems?.contains(data[i]) ?? false,
//                                 child: Icon(Icons.check, color: theme.colors.primary),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     const SizedBox(height: 12),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

Future<void> showMultiSelectListBottomSheet({
  required BuildContext context,
  required Future<List<RowItem>> data,
  required String title,
  required Function(List<RowItem>)? onMultiSelect, // Updated to support multi-select
  List<RowItem>? selectedItems, // Updated to List<RowItem>
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => MultiSelectListBottomSheet(
      data: data,
      title: title,
      onMultiSelect: onMultiSelect,
      selectedItems: selectedItems,
    ),
  );
}
