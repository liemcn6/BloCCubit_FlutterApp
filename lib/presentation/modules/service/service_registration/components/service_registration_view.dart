import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/custom_button.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/input_text_form_widget.dart';
import 'package:home_care/presentation/widgets/select_widget.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

import '../cubit/service_registration_cubit.dart';

class ServiceRegistrationView extends BaseWidget {
  const ServiceRegistrationView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    final theme = appController.state.theme;
    final cubit = context.watch<ServiceRegistrationCubit>();
    final state = cubit.state;

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.service_registration,
          visibleBack: true,
          onPressed: () {
            AppNavigator.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Column(
                children: [
                  SelectWidget(
                    title: tr.service_group,
                    onTap: () {
                      cubit.selectServiceGroup(context);
                    },
                    value: state.serviceGroup.name,
                  ),
                  const SizedBox(height: 16),
                  SelectWidget(
                      title: tr.service_type,
                      value: state.serviceType.name,
                      onTap: () {
                        cubit.selectServiceType(context);
                      }),
                  const SizedBox(height: 16),
                  SelectWidget(
                    title: tr.registration_date,
                    isCalendar: true,
                    onTap: () => cubit.selectDate(context),
                    value: DateTimeUtils.formatDateTime(
                      state.date.millisecondsSinceEpoch,
                      DateTimeUtils.dd_MM_yyyy,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SelectWidget(
                    title: tr.registration_time_frame,
                    icon: AppSvgs.icClock,
                    onTap: () => cubit.selectTimeFrame(context),
                    value: state.timeFrame.name,
                  ),
                  const SizedBox(height: 16),
                  SelectWidget(
                    title: tr.location_tag,
                    onTap: () => cubit.selectLocationTag(context),
                    value: state.locationTag.name,
                  ),
                  const SizedBox(height: 16),
                  InputTextFormWidget(
                    title: tr.price,
                    isDisable: true,
                    controller: cubit.priceCtrl,
                  ),
                  const SizedBox(height: 16),
                  InputTextFormWidget(
                    title: tr.service_total_money,
                    isDisable: true,
                    controller: cubit.totalMoneyCtrl,
                  ),
                  const SizedBox(height: 16),
                  TextsField(
                    theme: theme,
                    margin: EdgeInsets.zero,
                    controller: cubit.noteCtrl,
                    immobileLabelText: tr.note,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    borderType: BorderTypes.all,
                    radius: Dimension.radius8,
                    minLines: 3,
                    maxHeight: 240,
                    onChanged: (val) {
                      // cubit.changeNote(val);
                    },
                    maxLines: 4,
                    maxLength: 1000,
                    hintText: "",
                    // isRequired: true,
                    //t.enter_content,
                    // labelStyle: TextStyle(fontSize: 16, color: theme.colors.neutral10),
                    // hintStyle: TextStyle(fontSize: 16, color: theme.colors.neutral10),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomButton(
                  isDisable: !cubit.checkValid(),
                  onTap: () {
                    cubit.registerService();
                  },
                  content: tr.confirm,
                  margin: EdgeInsets.zero,
                  borderRadius: 8,
                  fontWeight: FontWeight.w600,
                  textSize: 14,
                ),
                const SizedBox(height: 8),
                CustomButton(
                  onTap: () {
                    AppNavigator.pop();
                  },
                  content: tr.cancel,
                  margin: EdgeInsets.zero,
                  borderRadius: 8,
                  color: theme.colors.white,
                  borderWidth: 1,
                  borderColor: theme.colors.neutral3,
                  textColor: theme.colors.btnSecondary,
                  fontWeight: FontWeight.w600,
                  textSize: 14,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
