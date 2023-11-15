import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/service/service_detail/cubit/service_detail_cubit.dart';

import 'components/service_detail_view.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String buildingId;
  final String facilityGroupIds;
  final String nameScreen;

  const ServiceDetailScreen({
    super.key,
    required this.buildingId,
    required this.facilityGroupIds,
    required this.nameScreen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceDetailCubit(),
      child: ServiceDetailView(
        buildingId: buildingId,
        facilityGroupIds: facilityGroupIds,
        nameScreen: nameScreen,
      ),
    );
  }
}
