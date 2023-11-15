import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/components/vehicle_list_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_list/cubit/vehicle_list_cubit.dart';

class VehicleListScreen extends StatelessWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleListCubit(),
      child: const VehicleListView(),
    );
  }
}
