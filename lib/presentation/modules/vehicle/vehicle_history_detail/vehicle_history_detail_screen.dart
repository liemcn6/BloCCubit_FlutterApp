import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/components/vehicle_history_detail_view.dart';
import 'package:home_care/presentation/modules/vehicle/vehicle_history_detail/cubit/vehicle_history_detail_cubit.dart';

class VehicleHistoryDetailScreen extends StatelessWidget {
  final String id;
  const VehicleHistoryDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleHistoryDetailCubit(),
      child: VehicleHistoryDetailView(id: id),
    );
  }
}
