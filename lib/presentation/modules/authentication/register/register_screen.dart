import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_care/core/core.dart';

import 'components/register_view.dart';
import 'cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.dismissKeyboard(),
      child: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const RegisterView(),
      ),
    );
  }
}
