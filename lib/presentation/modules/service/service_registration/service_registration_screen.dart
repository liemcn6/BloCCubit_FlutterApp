import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/service_registration_view.dart';
import 'cubit/service_registration_cubit.dart';

class ServiceRegistrationScreen extends StatelessWidget {
  const ServiceRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceRegistrationCubit(),
      child: const ServiceRegistrationView(),
    );
  }
}
