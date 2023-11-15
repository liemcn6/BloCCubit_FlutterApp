import 'package:home_care/domain/entities/emergency_support/hotline.dart';

mixin EmergencySupportRepo {
  Future<List<Hotline>> getHotlines();
}
