import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/button_view.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/text_field.dart';

import '../cubit/forgot_password_cubit.dart';

class ForgotPasswordView extends BaseWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget builder(BuildContext context, data, AppCubit appController, t) {
    final theme = appController.state.theme;
    final cubit = context.watch<ForgotPasswordCubit>();

    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: theme.colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Header(
                title: t.forgot_password_title,
              ),
            ),
            body: Form(
              child: Stack(children: [
                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const SizedBox(
                        //   height: 112,
                        // ),
                        // Icon(
                        //   size: 44,
                        //   Icons.mark_email_unread_outlined,
                        //   color: theme.colors.primary,
                        // ),
                        // const SizedBox(
                        //   height: 18,
                        // ),
                        // Text(t.email_link,
                        //     style: AppTextStyle.s16wBoldcRed.copyWith(color: theme.colors.primary)),

                        // const SizedBox(height: 4),
                        // Text(t.email_link_2,
                        //     style: AppTextStyle.s16wBoldcRed.copyWith(color: theme.colors.primary)),
                        // const SizedBox(
                        //   height: 24,
                        // ),
                        Text(
                          t.forgot_password_page_content,
                          style: AppTextStyle.s14w400.copyWith(color: theme.colors.neutral10),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextsField(
                          borderType: BorderTypes.all,
                          controller: cubit.emailController,
                          labelText: t.email,
                          onChanged: (text) => {cubit.validateEmail(text)},
                          margin: EdgeInsets.zero,
                          theme: theme,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 8),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: TextButton(
                        //       onPressed: () => {},
                        //       child: Text(
                        //         lang.resend_the_link_code,
                        //         style: const TextStyle(
                        //           color: Color(0xFF141ED2),
                        //           fontSize: FontSize.pt14,
                        //           fontWeight: FontWeight.w400,
                        //           decoration: TextDecoration.underline,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const Spacer(),
                        ButtonView(
                          // margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                          onPress: (_) {
                            if (cubit.state.isValidEmail) {
                              cubit.requestForgotPassword(context);
                            }
                          },
                          title: t.send_request,
                          disable: !cubit.state.isValidEmail,
                        ),

                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
