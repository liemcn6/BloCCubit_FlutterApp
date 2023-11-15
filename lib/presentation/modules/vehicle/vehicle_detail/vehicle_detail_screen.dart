import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/components/vehicle_detail_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_detail/cubit/vehicle_detail_cubit.dart';

class VehicleDetailScreen extends StatelessWidget {
  final String id;
  const VehicleDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleDetailCubit(),
      child: VehicleDetailView(id: id),
    );
  }
}
