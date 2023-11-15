import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_add_info/cubit/vehicle_add_info_cubit.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/input_text_form_widget.dart';
import 'package:home_care/presentation/widgets/select_widget.dart';

class VehicleAddInfoView extends BaseWidget {
  const VehicleAddInfoView({super.key});

  //late AddVehicleInformationCubit _cubit;

  @override
  onInit(BuildContext context) {
    //_cubit = context.read<AddVehicleInformationCubit>();
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<VehicleAddInfoCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.add_vehicle_information,
          visibleBack: true,
          onPressed: () {
            AppNavigator.pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: Dimension.padding16,
          left: Dimension.padding16,
          right: Dimension.padding16,
        ),
        height: MediaQuery.of(context).size.height - 56,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputTextFormWidget(
                      title: tr.car_owner,
                      controller: cubit.vehicleOwnerCtrl,
                      isRequired: true,
                      onChanged: (p0) => cubit.checkValidate(),
                    ),
                    const SizedBox(height: Dimension.h16),
                    SelectWidget(
                      title: tr.range_of_vehicle,
                      isRequired: true,
                      value: cubit.state.vehicleType?.name,
                      onTap: () {
                        cubit.chooseVehicleType(context);
                      },
                    ),
                    const SizedBox(height: Dimension.h16),
                    InputTextFormWidget(
                      title: tr.license_plates,
                      controller: cubit.vehiclePlateCtrl,
                      isRequired: true,
                      onChanged: (p0) => cubit.checkValidate(),
                    ),
                    const SizedBox(height: Dimension.h16),
                    InputTextFormWidget(
                      title: tr.car_company,
                      controller: cubit.vehicleBrandCtrl,
                      isRequired: true,
                      onChanged: (p0) => cubit.checkValidate(),
                    ),
                    const SizedBox(height: Dimension.h16),
                    InputTextFormWidget(
                      title: tr.vehicle_template,
                      controller: cubit.vehicleModelCtrl,
                    ),
                    const SizedBox(height: Dimension.h16),
                    InputTextFormWidget(
                      title: tr.car_color,
                      controller: cubit.vehicleColorCtrl,
                    ),
                    const SizedBox(height: Dimension.h16),

                    /// Image
                    _images(context, tr, theme),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buttons(context, tr, theme, cubit: cubit),
          ],
        ),
      ),
    );
  }

  /// Button()
  Widget _buttons(BuildContext context, AppLocalizations tr, AppTheme theme,
      {required VehicleAddInfoCubit cubit}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 16 * 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CardView(
            height: Dimension.h44,
            title: tr.add_car,
            color: theme.colors.primary,
            titleStyle: AppTextStyle.s14w600.copyWith(
              color: theme.colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.padding12,
            ),
            margin: EdgeInsets.zero,
            radius: Dimension.radius8,
            border: Border.all(color: theme.colors.border),
            onTap: () {
              cubit.doAddVehicle();
            },
            disable: !cubit.state.isValid,
          ),
          const Gap(Dimension.h8),
          CardView(
            height: Dimension.h44,
            title: tr.cancel,
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
              AppNavigator.pop();
            },
          ),
          const SizedBox(
            height: Dimension.h8,
          ),
        ],
      ),
    );
  }

  /// Image
  Widget _images(BuildContext context, AppLocalizations tr, AppTheme theme) {
    return Container(
      // height: 134,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.padding16,
        vertical: Dimension.padding12,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius8), color: theme.colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.vehicle_registration_photo,
            style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral6),
          ),
          const SizedBox(height: Dimension.h8),

          /// Image
          Row(
            children: [
              _image(
                context,
                theme,
                tr,
                content: tr.front,
                isFontPhoto: true,
                image: context.read<VehicleAddInfoCubit>().state.frontPhoto,
              ),
              const Gap(Dimension.h8),
              _image(
                context,
                theme,
                tr,
                content: tr.backside,
                isFontPhoto: false,
                image: context.read<VehicleAddInfoCubit>().state.backPhoto,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _image(
    BuildContext context,
    AppTheme theme,
    AppLocalizations t, {
    String? content,
    required bool isFontPhoto,
    ImageModel? image,
  }) {
    bool hasImage = (image != null && image.file != null);
    return InkWell(
      onTap: () {
        pickerImage(
          context,
          lang: t,
          onTapCamera: () {
            context.read<VehicleAddInfoCubit>().onTapCamera(isFontPhoto: isFontPhoto);
          },
          onTapGallery: () {
            context.read<VehicleAddInfoCubit>().onTapGallery(isFontPhoto: isFontPhoto);
          },
        );
      },
      child: hasImage
          ? Container(
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
                                child: Image.file(
                                  image.file!,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
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
                      child: Image.file(
                        image.file!,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),

                  /// Remove
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        context.read<VehicleAddInfoCubit>().delImage(isFontPhoto: isFontPhoto);
                      },
                      child: Container(
                        height: Dimension.h24,
                        width: Dimension.h24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimension.radius2),
                          color: theme.colors.neutral13.withOpacity(0.8),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: AppSvgs.icTrashWhite,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : DottedBorder(
              color: theme.colors.primary,
              strokeWidth: 1,
              dashPattern: const [5, 5],
              radius: const Radius.circular(Dimension.radius4),
              borderType: BorderType.RRect,
              child: SizedBox(
                height: 81,
                width: (MediaQuery.of(context).size.width - Dimension.padding16 * 5) / 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 21,
                      width: MediaQuery.of(context).size.width,
                      child: AppSvgs.icGalleryAdd,
                    ),
                    Text(
                      content ?? t.add_new,
                      style: AppTextStyle.s12w400.copyWith(
                        color: theme.colors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future pickerImage(
    BuildContext context, {
    required Function() onTapCamera,
    required Function()? onTapGallery,
    required AppLocalizations lang,
    Function()? onTapDocument,
    String? titleBottom,
    bool disableCamera = false,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BottomSheetWidget(
          title: titleBottom ?? lang.document,
          showIconClose: true,
          child: Column(
            children: [
              Visibility(
                visible: onTapGallery != null,
                child: renderItem(
                  context,
                  title: lang.image_gallery,
                  onTap: onTapGallery,
                  icon: Icons.image_outlined,
                ),
              ),
              renderItem(
                context,
                title: lang.use_camera,
                onTap: onTapCamera,
                icon: Icons.camera_alt_outlined,
              )
            ],
          ),
        );
      },
    );
  }

  CardView renderItem(
    BuildContext context, {
    Function()? onTap,
    required IconData icon,
    required String title,
  }) {
    return CardView(
      color: Colors.transparent,
      radius: 0,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
      onTap: () {
        Navigator.pop(context);

        if (!Utils.isNullOrEmpty(onTap)) {
          onTap!();
        }
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyle.s14w400cBlack,
          ),
        ],
      ),
    );
  }
}
