import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/domain/entities/file/illustration_file.dart' as file_image;
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/service/service_history.dart';
import 'package:home_care/domain/entities/service/service_list.dart';

import '/presentation/widgets/base_widget.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/core.dart';
import '../../../routes.dart';
import '../../../widgets/calendar_bottom_sheet.dart';
import '../../../widgets/card_view.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/image_network.dart';
import '../../../widgets/loading_wrapper.dart';
import '../service_detail/cubit/service_detail_cubit.dart';
import '../service_detail/widgets/show_register_bottom_sheet.dart';
import '../widgets/card_image_view.dart';
import '../widgets/floating_action_button_widget.dart';
import 'cubit/service_list_cubit.dart';

part 'components/service_category_view.dart';
part 'components/service_history_view.dart';
part 'components/service_list_view.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceListCubit>(
          create: (_) => ServiceListCubit(),
        ),
        BlocProvider<ServiceDetailCubit>(
          create: (_) => ServiceDetailCubit(),
        ),
      ],
      child: const ServiceListView(),
    );
  }
}
