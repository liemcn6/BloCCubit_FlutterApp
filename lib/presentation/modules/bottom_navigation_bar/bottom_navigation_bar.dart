import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/presentation/modules/home/home_screen.dart';
import 'package:home_care/presentation/modules/setting/setting_main/settings_screen.dart';
import 'package:home_care/presentation/modules/survey/survey_main/survey_main_screen.dart';
import 'package:home_care/presentation/modules/ticket/list_ticket/list_ticket_screen.dart';

part 'components/bottom_navigation_bar_view.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  const BottomNavigationBarWidget({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarView(
      selectedIndex: selectedIndex,
    );
  }
}
