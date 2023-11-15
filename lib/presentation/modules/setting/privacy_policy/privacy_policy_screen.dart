import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/presentation/widgets/header.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'components/privacy_policy_view.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrivacyPolicyView();
  }
}
