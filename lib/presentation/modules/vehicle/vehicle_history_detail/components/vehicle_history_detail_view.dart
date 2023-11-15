import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/cubit/vehicle_history_detail_cubit.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/cubit/vehicle_history_detail_state.dart';
import 'package:home_care/presentation/modules/vehicle/widgets/vehicle_info_item.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class VehicleHistoryDetailView extends BaseWidget {
  final String id;

  const VehicleHistoryDetailView({super.key, required this.id});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VehicleHistoryDetailCubit>().initData(id: id);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return BlocBuilder<VehicleHistoryDetailCubit, VehicleHistoryDetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colors.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Header(
              title:
                  "${tr.period} ${state.vehicleHistoryDetail?.month ?? "--"}/${state.vehicleHistoryDetail?.year ?? "--"}",
              visibleBack: true,
              onPressed: () {
                AppNavigator.pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Title Info
                Text(
                  tr.registration_information,
                  style: AppTextStyle.s16w600.copyWith(
                    color: theme.colors.neutral13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                const Gap(Dimension.h16),

                /// Info
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimension.radius8,
                      ),
                      color: theme.colors.white),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimension.padding16,
                    vertical: Dimension.padding6,
                  ),
                  child: Column(
                    children: [
                      _itemDetail(
                        theme,
                        title: tr.subscribers,
                        content: state.vehicleHistoryDetail?.issuedUserFullName ?? "--",
                      ),
                      _itemDetail(
                        theme,
                        title: tr.building,
                        content: state.vehicleHistoryDetail?.buildingName ?? "--",
                      ),
                      _itemDetail(theme,
                          title: tr.registration_period,
                          content:
                              "${state.vehicleHistoryDetail?.month ?? "--"}/${state.vehicleHistoryDetail?.year ?? "--"}",
                          showBottomLine: false),
                    ],
                  ),
                ),

                const Gap(Dimension.h24),

                ///vehicle information
                Text(
                  tr.vehicle_information,
                  style: AppTextStyle.s16w600.copyWith(
                    color: theme.colors.neutral13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                const Gap(Dimension.h16),

                Expanded(
                  child: ListWidget(
                    itemCount: state.vehicleHistoryDetail?.registeredVehicles?.length ?? 0,
                    itemBuilder: (context, index) => Column(
                      children: [
                        VehicleInfoItem(
                          controlPlate:
                              state.vehicleHistoryDetail?.registeredVehicles?[index].licensePlate,
                          type: context.read<VehicleHistoryDetailCubit>().getVehicleTypeByString(
                              value: state.vehicleHistoryDetail?.registeredVehicles?[index]
                                  .vehicleTypeName),
                          onTapItem: () {
                            final vehicle = state.vehicleHistoryDetail?.registeredVehicles?[index];

                            /// COMMENT
                            AppNavigator.push(
                              Routes.vehicleEditInfo,
                              {
                                "vehicleCreate": VehicleCreate(
                                  files: vehicle?.files
                                      ?.map((e) => ImageModel(
                                            networkData: IllustrationFile(
                                              viewUrl: e.viewUrl,
                                              fileId: e.fileId,
                                              originalName: e.originalName,
                                            ),
                                            type: ImageType.network,
                                          ))
                                      .toList(),
                                  color: vehicle?.color,
                                  identification: vehicle?.identification,
                                  licensePlate: vehicle?.licensePlate,
                                  manufacturer: vehicle?.manufacturer,
                                  model: vehicle?.model,
                                  ownerName: vehicle?.ownerName,
                                  vehicleTypeName: vehicle?.vehicleTypeName,
                                ),
                                "isEdit": false,
                                "buildingId": vehicle?.buildingId ?? "",
                              },
                            );
                          },
                        ),
                        const Gap(Dimension.h16),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _itemDetail(
    AppTheme theme, {
    String? title,
    dynamic content,
    bool showBottomLine = true,
  }) {
    Widget content0 = const SizedBox.shrink();
    if (content is String) {
      content0 = Text(
        content,
        style: AppTextStyle.s16w400.copyWith(color: theme.colors.neutral13),
      );
    }
    if (content is Widget) {
      content0 = content;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding6),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "",
            style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
          ),
          const SizedBox(
            height: Dimension.padding8,
          ),
          Row(
            children: [
              content0,
            ],
          ),
          const SizedBox(
            height: Dimension.padding12,
          ),
          showBottomLine
              ? Divider(
                  color: theme.colors.border,
                  height: 1,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
