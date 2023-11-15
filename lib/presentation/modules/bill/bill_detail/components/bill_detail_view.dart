import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/bill/bill_detail/cubit/bill_detail_cubit.dart';
import 'package:home_care/presentation/modules/bill/bill_detail/widgets/bill_payment_list.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/base_widget.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';

import '../widgets/bill_detail_head.dart';

class BillDetailView extends BaseWidget {
  const BillDetailView({Key? key}) : super(key: key);

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BillDetailCubit>().getBillDetail();
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, initData, AppCubit appController, AppLocalizations tr) {
    // final theme = appController.state.theme;
    final cubit = context.watch<BillDetailCubit>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: tr.bill_detail,
          actions: [
            IconButton(
              onPressed: () => AppNavigator.push(Routes.billHistory, cubit.billId),
              icon: AppSvgs.icHistory,
            ),
          ],
        ),
      ),
      body: LoadingWrapper(
        isLoaded: cubit.state.isLoaded,
        child: Column(children: [
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () => cubit.getBillDetail(),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    BillDetailHead(),
                    BillPaymentList(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
