import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/components/service_history_detail_view.dart';
import 'package:home_care/presentation/modules/service/service_history_detail/cubit/service_history_detail_cubit.dart';

class ServiceHistoryDetailScreen extends StatelessWidget {
  final String id;

  const ServiceHistoryDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceHistoryDetailCubit(),
      child: ServiceHistoryDetailView(id: id),
    );
  }
}
