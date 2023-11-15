import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_edit_info/components/vehicle_edit_info_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_edit_info/cubit/vehicle_edit_info_cubit.dart';

class VehicleEditInfoScreen extends StatelessWidget {
  final String buildingId;
  final VehicleCreate vehicleCreate;
  final bool isEdit;

  const VehicleEditInfoScreen({
    required this.buildingId,
    required this.vehicleCreate,
    this.isEdit = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleEditInfoCubit(
        buildingId: buildingId,
        vehicleCreate: vehicleCreate,
      ),
      child: VehicleEditInfoView(isEdit: isEdit),
    );
  }
}
