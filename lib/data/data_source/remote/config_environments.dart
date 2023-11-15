import 'package:home_care/configs.dart';

class Environments {
  static const String production = 'production';
  static const String qa = 'qa';
  static const String dev = 'dev';
}

class ConfigEnvironments {
  static const String _currentEnvironments = AppConfigs.environment;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.dev,
      'url': 'http://dev-evotek-bms-api.evotek.vn/',
    },
    {
      'env': Environments.qa,
      'url': 'http://qa-evotek-bms-api.evotek.vn/',
    },
    {
      'env': Environments.production,
      'url': 'https://opencity.evotek.vn/api/',
    },
  ];

  static String getUrl() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['url'] ??
        '';
  }

  static String getEnvironment() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['env'] ??
        Environments.dev;
  }
}
