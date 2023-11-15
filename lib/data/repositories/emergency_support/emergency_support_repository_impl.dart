import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/emergency_support/emergency_support_data_response.dart';
import 'package:home_care/domain/entities/emergency_support/hotline.dart';
import 'package:home_care/domain/repositories/emergency_support/emergency_support_repo.dart';

class EmergencySupportRepositoryImpl extends BaseRepository with EmergencySupportRepo {
  @override
  Future<List<Hotline>> getHotlines() async {
    final List<Hotline> hotlines = [];
    final res = await Result.guardAsync(() => get(ApiEndpoints.hotline));

    if (res.isSuccess) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);

      // Check data is array
      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          final hotline = EmergencySupportDataResponse.fromJson(e);

          if (hotline.title != null && hotline.phoneNumber != null) {
            hotlines.add(Hotline(title: hotline.title!, phoneNumber: hotline.phoneNumber!));
          }
        }
      }
    }

    return hotlines;
  }
}
