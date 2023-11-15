import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/components/vehicle_register_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_register/cubit/vehicle_register_cubit.dart';

class VehicleRegisterScreen extends StatelessWidget {
  final String? id;
  const VehicleRegisterScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleRegisterCubit(),
      child: VehicleRegisterView(id: id),
    );
  }
}
