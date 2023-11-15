import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/contract/contract_detail/cubit/contract_detail_cubit.dart';
import 'package:home_care/presentation/modules/contract/contract_detail/cubit/contract_detail_state.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_detail_model.dart';
import 'package:home_care/presentation/modules/contract/model/entities/leasing_price_model.dart';
import 'package:home_care/presentation/modules/contract/model/entities/leasing_unit_model.dart';
import 'package:home_care/presentation/modules/contract/model/enum/statuses_enum.dart';
import 'package:home_care/presentation/modules/contract/model/enum/value_type_enum.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:home_care/presentation/widgets/home_icon.dart';
import 'package:home_care/presentation/widgets/item_info_reverse_widget.dart';
import 'package:home_care/presentation/widgets/item_info_widget.dart';

part 'components/contract_detail_view.dart';

class ContractDetailScreen extends StatelessWidget {
  final String contractId;

  const ContractDetailScreen({super.key, required this.contractId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContractDetailCubit(),
      child: ContractDetailView(contractId: contractId),
    );
  }
}
