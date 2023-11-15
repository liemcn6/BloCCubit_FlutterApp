import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart' as file_image;
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_cubit.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_state.dart';
import 'package:home_care/presentation/modules/service/service_detail/widgets/show_register_bottom_sheet.dart';
import 'package:home_care/presentation/modules/service/widgets/card_image_view.dart';
import 'package:home_care/presentation/modules/service/widgets/floating_action_button_widget.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

class ServiceDetailView extends BaseWidget {
  final String buildingId;
  final String facilityGroupIds;
  final String nameScreen;

  const ServiceDetailView(
      {super.key,
      required this.buildingId,
      required this.facilityGroupIds,
      required this.nameScreen});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ServiceDetailCubit>()
          .initData(buildingIds: buildingId, facilityGroupIds: facilityGroupIds);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ServiceDetailCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: nameScreen,
          visibleBack: true,
          onPressed: () {
            AppNavigator.pop();
          },
        ),
      ),
      body: BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
        buildWhen: (previous, current) {
          final serviceDetailList = previous.serviceDetailList != current.serviceDetailList;
          final loadMore = previous.loadMore != current.loadMore;
          return serviceDetailList || loadMore;
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async =>
                await cubit.initData(buildingIds: buildingId, facilityGroupIds: facilityGroupIds),
            child: Column(
              children: [
                Expanded(
                  child: ListWidget(
                    enableLoadMore: state.loadMore ?? false,
                    onLoadMore: () async => cubit.loadMore(
                      buildingIds: buildingId,
                      facilityGroupIds: facilityGroupIds,
                    ),
                    itemCount: state.serviceDetailList?.length ?? 0,
                    margin: const EdgeInsets.all(Dimension.padding16),
                    itemBuilder: (context, index) {
                      final item = state.serviceDetailList?[index];
                      return CardImageView(
                        theme: theme,
                        tr: tr,
                        title: item?.name,
                        content: "${item?.areaName}, ${item?.buildingName}, ${item?.unitName}",
                        image: ImageModel(
                          networkData: file_image.IllustrationFile(
                            id: item?.illustrationFile?.id,
                            viewUrl: item?.illustrationFile?.viewUrl,
                            downloadUrl: item?.illustrationFile?.viewUrl,
                            originalName: item?.illustrationFile?.originalName,
                          ),
                        ),
                        id: item?.id ?? "",
                        onTapItem: (id) async {
                          await UtilsService.showRegisterBottomSheet(
                              context, theme, context.read<ServiceDetailCubit>(), tr,
                              id: id);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButtonWidget(
          theme: theme,
          onTap: () {
            AppNavigator.push(Routes.serviceRegistration);
          }),
    );
  }
}
