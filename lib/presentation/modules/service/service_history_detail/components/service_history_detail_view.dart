import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/cubit/service_history_detail_cubit.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/cubit/service_history_detail_state.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/widgets/item_service_history_detail.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/widgets/item_service_history_list_detail.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/text_form_field.dart';

class ServiceHistoryDetailView extends BaseWidget {
  final String id;

  const ServiceHistoryDetailView({super.key, required this.id});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ServiceHistoryDetailCubit>().initData(id: id);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ServiceHistoryDetailCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.utility_service_registration_information,
          visibleBack: true,
          onPressed: () {
            AppNavigator.pop();
          },
        ),
      ),
      body: Scaffold(
        backgroundColor: theme.colors.background,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _tab(cubit, theme, tr, ServiceHistoryDetailType.detail),
                ),
                Expanded(
                  flex: 1,
                  child: _tab(cubit, theme, tr, ServiceHistoryDetailType.history),
                ),
              ],
            ),
            SingleChildScrollView(
              child: BlocBuilder<ServiceHistoryDetailCubit, ServiceHistoryDetailState>(
                builder: (context, state) => SizedBox(
                  child: state.type == ServiceHistoryDetailType.detail
                      ? _detail(context, theme, tr, cubit, state)
                      : _history(theme, tr, state),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<ServiceHistoryDetailCubit, ServiceHistoryDetailState>(
        bloc: cubit,
        builder: (context, state) {
          final t = Utils.languageOf(context);
          final detail = state.serviceRegisterDetail;
          return Visibility(
            visible: state.showCancelButton,
            child: SizedBox(
              height: Dimension.h64,
              width: MediaQuery.of(context).size.width - Dimension.padding4 * 2,
              child: CardView(
                width: MediaQuery.of(context).size.width - Dimension.padding8 * 2,
                //margin: const EdgeInsets.symmetric(horizontal: Dimension.padding16, vertical: Dimension.padding10),
                onTap: () {
                  onTapCancel(context, theme, t, cubit, state, id: detail?.id ?? "");
                },
                border: Border.all(color: theme.colors.border),
                radius: Dimension.radius8,
                color: theme.colors.white,
                child: Text(
                  tr.cancel_appointment,
                  style: AppTextStyle.s14w600.copyWith(color: theme.colors.neutral13),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _tab(ServiceHistoryDetailCubit cubit, AppTheme theme, AppLocalizations t,
      ServiceHistoryDetailType tabType) {
    return GestureDetector(
      onTap: () => cubit.switchTab(tabType),
      behavior: HitTestBehavior.opaque,
      child: BlocBuilder<ServiceHistoryDetailCubit, ServiceHistoryDetailState>(
        builder: (context, state) {
          return Container(
            height: 52,
            decoration: BoxDecoration(
              color: theme.colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 2.0,
                  color: state.type == tabType ? theme.colors.green8 : theme.colors.white,
                ),
              ),
            ),
            child: Center(
              child: Text(
                tabType == ServiceHistoryDetailType.detail
                    ? t.register_details
                    : t.approval_history,
                style: AppTextStyle.s14w400cBlack.copyWith(
                  fontWeight: FontWeight.w600,
                  color: state.type == tabType ? theme.colors.green8 : theme.colors.neutral13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Detail
  Widget _detail(
    BuildContext context,
    AppTheme theme,
    AppLocalizations t,
    ServiceHistoryDetailCubit cubit,
    ServiceHistoryDetailState state,
  ) {
    final detail = state.serviceRegisterDetail;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colors.white,
              borderRadius: BorderRadius.circular(Dimension.radius8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.padding16,
              vertical: Dimension.padding12,
            ),
            margin: const EdgeInsets.all(Dimension.padding16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ItemServiceHistoryDetail(
                    theme: theme, title: t.building, content: detail?.buildingName ?? "--"),
                ItemServiceHistoryDetail(
                    theme: theme,
                    title: t.service_group,
                    content: detail?.facilityGroupName ?? "--"),
                ItemServiceHistoryDetail(
                    theme: theme, title: t.type_of_service, content: detail?.facilityName ?? "--"),
                ItemServiceHistoryDetail(
                    theme: theme, title: t.premises_apartments, content: detail?.unitName ?? "--"),
                ItemServiceHistoryDetail(
                    theme: theme, title: t.dayRegister, content: detail?.registrationDate),
                ItemServiceHistoryDetail(
                    theme: theme,
                    title: t.registration_time_frame,
                    content:
                        "${DateTimeUtils.formatDateTime(detail?.startTime, DateTimeUtils.HH_mm) ?? "--"} - ${DateTimeUtils.formatDateTime(detail?.endTime, DateTimeUtils.HH_mm) ?? "--"}"),
                ItemServiceHistoryDetail(
                    theme: theme,
                    title: t.into_money,
                    content: StringUtils.formatStringToCash(cash: detail?.totalAmount),
                    showBottomLine: false),
                //_itemDetail(theme, title: "Bắt đầu tính phí", content: "20/11/2023", showBottomLine: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// History
  Widget _history(AppTheme theme, AppLocalizations t, ServiceHistoryDetailState state) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(Dimension.padding16),
      itemCount: state.serviceHistoryList?.length ?? 0,
      itemBuilder: (context, index) => ItemServiceHistoryListDetail(
          theme: theme, t: t, index: index, history: state.serviceHistoryList?[index]),
    );
  }

  // onTapCancel
  void onTapCancel(
    BuildContext context,
    AppTheme theme,
    AppLocalizations tr,
    ServiceHistoryDetailCubit cubit,
    ServiceHistoryDetailState state, {
    required String id,
  }) {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colors.background,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        return BlocBuilder<ServiceHistoryDetailCubit, ServiceHistoryDetailState>(
          bloc: cubit,
          buildWhen: (previous, current) => previous.disableConfirm != current.disableConfirm,
          builder: (context, state) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                          tr.cancel_appointment,
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
                  Padding(
                    padding: const EdgeInsets.all(Dimension.padding16),
                    child: TextsField(
                      margin: EdgeInsets.zero,
                      maxLines: 5,
                      controller: controller,
                      theme: theme,
                      borderColor: theme.colors.border,
                      borderType: BorderTypes.all,
                      radius: 8,
                      hintText: tr.enter_cancellation_reason,
                      onChanged: (val) {
                        cubit.checkDisableConfirm(val);
                      },
                    ),
                  ),
                  const Gap(Dimension.h8),
                  CardView(
                    disable: state.disableConfirm,
                    height: Dimension.padding44,
                    margin: const EdgeInsets.symmetric(
                        horizontal: Dimension.padding16, vertical: Dimension.padding10),
                    onTap: () async {
                      final result = await cubit.callApiCancel(id: id, request: controller.text);
                      if (result) {
                        if (!context.mounted) return;
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    radius: Dimension.radius8,
                    color: theme.colors.primary,
                    child: Text(
                      tr.confirm,
                      style: AppTextStyle.s14w600.copyWith(color: theme.colors.white),
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
}
