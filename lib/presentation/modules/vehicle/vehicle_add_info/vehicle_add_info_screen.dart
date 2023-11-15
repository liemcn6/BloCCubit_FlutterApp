import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_add_info/components/vehicle_add_info_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_add_info/cubit/vehicle_add_info_cubit.dart';

class VehicleAddInfoScreen extends StatelessWidget {
  final String buildingId;
  const VehicleAddInfoScreen({required this.buildingId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleAddInfoCubit(
        buildingId: buildingId,
      ),
      child: const VehicleAddInfoView(),
    );
  }
}
