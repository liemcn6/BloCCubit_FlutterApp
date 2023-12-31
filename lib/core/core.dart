import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_care/core/app_cubit/app_cubit.dart';
import 'package:home_care/core/app_cubit/app_state.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/domain/entities/file/picker_image_type.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/presentation/modules/contract/model/enum/value_type_enum.dart';
import 'package:home_care/presentation/widgets/custom_button.dart';
import 'package:home_care/presentation/widgets/error_dialog.dart';
import 'package:home_care/presentation/widgets/snackbar_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'app_assets.dart';
part 'app_colors.dart';
part 'app_constants.dart';
part 'app_image_lang.dart';
part 'app_shared_preferences.dart';
part 'app_text_style.dart';
part 'app_theme.dart';
part 'log.dart';
part 'utils/datetime_utils.dart';
part 'utils/device_utils.dart';
part 'utils/file_utils.dart';
part 'utils/regex_utils.dart';
part 'utils/result_utils.dart';
part 'utils/string_utils.dart';
part 'utils/utils.dart';
part 'utils/validate_utils.dart';
part 'utils/widget_utils.dart';

final getIt = GetIt.instance;
