import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_cubit.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_state.dart';
import 'package:home_care/presentation/modules/service/service_detail/widgets/box_select.dart';
import 'package:home_care/presentation/modules/service/service_detail/widgets/box_time_select.dart';
import 'package:home_care/presentation/modules/service/service_detail/widgets/calendar_button.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:intl/intl.dart';

class UtilsService {
  static Future showRegisterBottomSheet(
    BuildContext context,
    AppTheme theme,
    ServiceDetailCubit cubit,
    AppLocalizations tr, {
    required String id,
  }) async {
    context.read<ServiceDetailCubit>().getServiceDetail(id: id);
    if (!context.mounted) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BlocBuilder<ServiceDetailCubit, ServiceDetailState>(
          bloc: cubit,
          buildWhen: (previous, current) {
            final serviceDetail = previous.serviceDetail != current.serviceDetail;
            final facilityOptionSelect =
                previous.facilityOptionSelect != current.facilityOptionSelect;
            final timeRegisterSelect = previous.timeRegisterSelect != current.timeRegisterSelect;
            final timeTemporarily = previous.timeTemporarily != current.timeTemporarily;
            final disableRegisterButton =
                previous.disableRegisterButton != current.disableRegisterButton;
            return serviceDetail ||
                facilityOptionSelect ||
                timeRegisterSelect ||
                timeTemporarily ||
                disableRegisterButton;
          },
          builder: (myContext, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height - Dimension.h70,
              child: Stack(
                children: [
                  Column(
                    children: [
                      /// title
                      Container(
                        height: Dimension.h48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: theme.colors.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Dimension.radius8),
                            topRight: Radius.circular(Dimension.radius8),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              tr.service_detail,
                              style: AppTextStyle.s16w500.copyWith(color: theme.colors.white),
                            ),
                            Positioned(
                              right: Dimension.padding16,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: theme.colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      /// Body
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 168,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: Dimension.h128,
                                width: double.infinity,
                                child: ImgNetWork(
                                  url: state.serviceDetail?.illustrationFile?.viewUrl,
                                  width: 100,
                                ),
                              ),

                              /// Info
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: Dimension.padding16,
                                  right: Dimension.padding16,
                                  left: Dimension.padding16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.serviceDetail?.name ?? "",
                                      style: AppTextStyle.s24w600cBlack
                                          .copyWith(color: theme.colors.neutral13),
                                    ),
                                    const Gap(Dimension.padding16),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: Dimension.h20,
                                            width: Dimension.h20,
                                            child: AppSvgs.icLocal),
                                        const Gap(Dimension.padding8),
                                        Expanded(
                                          child: Text(
                                            "${state.serviceDetail?.areaName ?? ""}, ${state.serviceDetail?.buildingName ?? ""}, ${state.serviceDetail?.unitName ?? ""}",
                                            style: AppTextStyle.s14w400
                                                .copyWith(color: theme.colors.neutral13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(Dimension.padding12),
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: Dimension.h20,
                                            width: Dimension.h20,
                                            child: AppSvgs.icOclock),
                                        const Gap(Dimension.padding8),
                                        Text(
                                          "${tr.open_at} ${DateTimeUtils.formatDateTime(state.serviceDetail?.endTime, DateTimeUtils.HH_mm) ?? "--"} - ${DateTimeUtils.formatDateTime(state.serviceDetail?.startTime, DateTimeUtils.HH_mm) ?? "--"}",
                                          style: AppTextStyle.s14w400
                                              .copyWith(color: theme.colors.neutral13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(Dimension.padding16),

                              /// Choose day
                              SizedBox(
                                height: Dimension.h108,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title(theme, title: tr.select_registration_date),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: Dimension.padding16, top: Dimension.padding4),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: List.generate(4, (index) {
                                              DateTime date =
                                                  (state.timeTemporarily ?? DateTime.now())
                                                      .add(Duration(days: index));
                                              return Row(
                                                children: [
                                                  BoxSelect(
                                                    theme: theme,
                                                    isSelected: DateUtils.isSameDay(
                                                        state.timeRegisterSelect, date),
                                                    onTapItem: () {
                                                      cubit.changTimeRegisterSelect(date);
                                                    },
                                                    title: cubit.getDayWeed(date),
                                                    content: DateFormat("dd/MM").format(date),
                                                  ),
                                                  const Gap(Dimension.h8),
                                                ],
                                              );
                                            }),
                                          ),
                                          CalendarButton(
                                            theme: theme,
                                            tr: tr,
                                            callBackDateTime: (date) {
                                              cubit.changTimeRegisterSelect(date);
                                            },
                                            currentDay: state.timeRegisterSelect,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(Dimension.padding16),

                              /// Choose time
                              SizedBox(
                                height: Dimension.h108,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title(theme, title: tr.choose_a_time_frame),
                                    SizedBox(
                                      height: 62,
                                      child: ListView.separated(
                                          padding: const EdgeInsets.only(left: Dimension.padding16),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final item =
                                                state.serviceDetail?.facilityOptions?[index];
                                            return BoxTimeSelect(
                                                theme: theme,
                                                title:
                                                    "${DateTimeUtils.formatDateTime(item?.startTime, DateTimeUtils.HH_mm) ?? ""} - ${DateTimeUtils.formatDateTime(item?.endTime, DateTimeUtils.HH_mm) ?? ""}",
                                                content:
                                                    "${StringUtils.formatStringToCash(cash: item?.unitPrice)}/${tr.hour}",
                                                isSelected:
                                                    state.facilityOptionSelect?.id == item?.id,
                                                disable: item?.isMaxSlot ?? false,
                                                onTapItem: () {
                                                  cubit.changeFacilityOptionSelect(
                                                    item ?? FacilityOption(),
                                                  );
                                                });
                                          },
                                          separatorBuilder: (context, index) =>
                                              const Gap(Dimension.padding8),
                                          itemCount:
                                              state.serviceDetail?.facilityOptions?.length ?? 0),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(Dimension.padding16),

                              /// Content
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title(theme, title: tr.regulations_and_terms),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: Dimension.padding4,
                                        left: Dimension.padding16,
                                        right: Dimension.padding16,
                                        bottom: Dimension.padding16,
                                      ),
                                      child: Text(
                                        state.serviceDetail?.terms ?? "",
                                        style: AppTextStyle.s14w400.copyWith(
                                          color: theme.colors.neutral10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(Dimension.padding16),
                            ],
                          ),
                        ),
                      ),

                      const Gap(Dimension.h50),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: theme.colors.white,
                      padding: const EdgeInsets.symmetric(vertical: Dimension.padding8),
                      child: CardView(
                        disable: state.disableRegisterButton ?? false,
                        height: Dimension.h44,
                        width: MediaQuery.of(context).size.width - (Dimension.padding16 * 2),
                        onTap: () async {
                          final success = await cubit.callApiRegisterButton();

                          if (success) {
                            if (!context.mounted) return;
                            WidgetUtils.showPopUpSuccess(
                                context: context,
                                content: tr.registered_successfully,
                                showButtonNo: false,
                                titleButtonYes: tr.close,
                                onTapYes: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                          }
                        },
                        child: Text(
                          tr.register,
                          style: AppTextStyle.s14w600.copyWith(color: theme.colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget _title(AppTheme theme, {String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.padding16,
        vertical: Dimension.padding8,
      ),
      child: Text(
        title ?? "",
        style: AppTextStyle.s16w600.copyWith(color: theme.colors.neutral13),
      ),
    );
  }
}
