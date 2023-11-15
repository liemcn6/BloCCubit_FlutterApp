import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/modules/vehicle/enum/registration_status.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/cubit/vehicle_detail_cubit.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/cubit/vehicle_detail_state.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

class VehicleDetailView extends BaseWidget {
  final String id;
  const VehicleDetailView({super.key, this.id = "b10f0006-64ba-4dd5-812a-cc0b274455be"});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VehicleDetailCubit>().initData(id: id);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    return BlocBuilder<VehicleDetailCubit, VehicleDetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colors.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Header(
              title: state.vehicleDetail?.licensePlate ?? "",
              visibleBack: true,
              onPressed: () {
                AppNavigator.pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              Dimension.padding16,
            ),
            child: Column(
              children: [
                /// info
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
                        title: tr.car_owner,
                        content: state.vehicleDetail?.ownerName ?? "",
                      ),
                      _itemDetail(
                        theme,
                        title: tr.transportation,
                        content: state.vehicleDetail?.vehicleTypeName ?? "",
                      ),
                      _itemDetail(
                        theme,
                        title: tr.license_plates,
                        content: state.vehicleDetail?.licensePlate ?? "",
                      ),
                      _itemDetail(
                        theme,
                        title: tr.car_company,
                        content: state.vehicleDetail?.manufacturer ?? "",
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _itemDetail(
                              theme,
                              title: tr.car_model,
                              content: state.vehicleDetail?.model ?? "",
                            ),
                          ),
                          Expanded(
                            child: _itemDetail(
                              theme,
                              title: tr.car_color,
                              content: state.vehicleDetail?.color ?? "",
                            ),
                          ),
                        ],
                      ),
                      _itemDetail(theme,
                          title: tr.vehicle_registration_certificate,
                          content: Row(
                            children: state.vehicleDetail?.files
                                    ?.map(
                                      (e) => _image(
                                        context,
                                        theme,
                                        image: ImageModel(
                                          id: "",
                                          type: ImageType.network,
                                          networkData: IllustrationFile(
                                            downloadUrl: e.downloadUrl,
                                            viewUrl: e.viewUrl,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                          showBottomLine: false),
                    ],
                  ),
                ),
                const Gap(Dimension.h16),

                /// DATE - STATUS
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
                        title: tr.registration_date,
                        content:
                            DateTimeUtils.convertDateInit(state.vehicleDetail?.registrationDate),
                      ),
                      _itemDetail(
                        theme,
                        title: tr.billing_start_date,
                        content: DateTimeUtils.convertDateInit(state.vehicleDetail?.startDate),
                      ),
                      _itemDetail(theme,
                          title: tr.status,
                          content: RegistrationStatusExS.getStatusWidget(
                            theme,
                            tr,
                            context
                                .read<VehicleDetailCubit>()
                                .getRegistrationStatusByString(state.vehicleDetail?.status),
                          ),
                          showBottomLine: false),
                    ],
                  ),
                ),

                const Gap(Dimension.h16),

                /// Button
                Visibility(
                  /// Maybe ""deleted": true," ????
                  visible: context
                      .read<VehicleDetailCubit>()
                      .showButtonCancel(state.vehicleDetail?.status),
                  child: _cancelButton(context, tr, theme),
                ),
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

  /// cancel Button
  Widget _cancelButton(BuildContext context, AppLocalizations tr, AppTheme theme) {
    return CardView(
      height: Dimension.h44,
      title: tr.cancel_registration,
      color: theme.colors.white,
      titleStyle: AppTextStyle.s14w600.copyWith(
        color: theme.colors.neutral10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.padding12,
      ),
      margin: EdgeInsets.zero,
      radius: Dimension.radius8,
      border: Border.all(color: theme.colors.border),
      onTap: () {
        showPopUp(
          context,
          theme,
          tr,
          () async {
            final resultPass = await context.read<VehicleDetailCubit>().postCancelVehicle(id: id);
            if (resultPass) {
              if (!context.mounted) return;
              Navigator.pop(context);
              AppNavigator.pop();
            } else {
              /// NO PASS
            }
          },
        );
      },
    );
  }

  /// show popUp
  void showPopUp(
      BuildContext context, AppTheme theme, AppLocalizations lang, VoidCallback onTapYes) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) => DialogCustom(
            colorTitle: theme.colors.red,
            colorButtonAccept: theme.colors.primary,
            textBtnAccept: lang.confirm,
            showBtnCancel: true,
            textBtnCancel: lang.back,
            title: lang.notify,
            content: lang.confirmation_of_vehicle_registration_cancellation,
            onPressBtnAccept: () async {
              onTapYes.call();
            },
            onPressBtnCancel: () => {Navigator.of(dialogContext).pop()}));
  }

  ///image
  Widget _image(BuildContext context, AppTheme theme, {ImageModel? image}) {
    if (image == null) {
      return Container(
        height: 88,
        width: (MediaQuery.of(context).size.width - Dimension.padding16 * 5) / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.radius4),
            border: Border.all(color: theme.colors.neutral3)),
        padding: const EdgeInsets.all(3),
        child: Icon(
          Icons.image,
          color: theme.colors.primary,
        ),
      );
    } else {
      return Container(
        height: 88,
        width: (MediaQuery.of(context).size.width - Dimension.padding16 * 5) / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.radius4),
            border: Border.all(color: theme.colors.neutral3)),
        padding: const EdgeInsets.all(3),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  barrierColor: Colors.black,
                  builder: (context) => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: InteractiveViewer(
                          child: ImgNetWork(
                            url: image.networkData?.viewUrl ?? "",
                            width: 100,
                          ),
                        ),
                      ),

                      /// Remove
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: Dimension.h24,
                            width: Dimension.h24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colors.white,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: AppSvgs.icClose,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: SizedBox(
                height: 88,
                width: (MediaQuery.of(context).size.width - Dimension.padding16 * 5) / 2,
                child: ImgNetWork(
                  url: image.networkData?.viewUrl ?? "",
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
