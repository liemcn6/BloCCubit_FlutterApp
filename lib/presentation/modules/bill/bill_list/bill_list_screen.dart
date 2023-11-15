import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/domain/entities/bill/bill_list.dart';
import 'package:home_care/presentation/widgets/loading_wrapper.dart';

import '/presentation/widgets/base_widget.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/core.dart';
import '../../../routes.dart';
import '../../../widgets/common_widget.dart';
import 'cubit/bill_list_cubit.dart';

part 'components/bill_list_view.dart';

class BillListScreen extends StatelessWidget {
  const BillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BillListCubit(),
      child: const BillListScreenView(),
    );
  }
}
