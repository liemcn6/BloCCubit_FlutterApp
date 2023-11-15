import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/contract/contract/cubit/contract_cubit.dart';
import 'package:home_care/presentation/modules/contract/contract/cubit/contract_state.dart';
import 'package:home_care/presentation/modules/contract/widgets/item_contract_widget.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/large_header.dart';
import 'package:home_care/presentation/widgets/list_widget.dart';

part 'components/contract_view.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContractCubit(),
      child: const ContractView(),
    );
  }
}
