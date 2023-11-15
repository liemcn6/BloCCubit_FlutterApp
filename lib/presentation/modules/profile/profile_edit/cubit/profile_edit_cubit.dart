import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/response/profile/profile_edit_response.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/usecases/file/upload_files_usecase.dart';
import 'package:home_care/domain/usecases/profile/profile_edit_usecase.dart';
import 'package:home_care/domain/usecases/profile/profile_usecase.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/models/gender_type_enum.dart';
import 'package:home_care/presentation/modules/profile/profile_edit/models/upload_type_model.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:home_care/presentation/widgets/form_validators/email.dart';
import 'package:home_care/presentation/widgets/form_validators/full_name.dart';
import 'package:home_care/presentation/widgets/form_validators/phone.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  final GlobalKey<FormState> formKeyPE = GlobalKey<FormState>();
  final TextEditingController fullNameCT = TextEditingController(text: "");
  final TextEditingController phoneNumberCT = TextEditingController(text: "");
  final TextEditingController emailCT = TextEditingController(text: "");
  final TextEditingController birthdayCT = TextEditingController(text: "");
  final TextEditingController genderCT = TextEditingController(text: "");
  //vaalidate
  FullName fullName = const FullName.dirty("");
  PhoneNumber phoneNumber = const PhoneNumber.dirty("");
  Email email = const Email.dirty("");
  ProfileEditCubit() : super(ProfileEditInitial());

  //usecase
  final profileUseCase = getIt.get<ProfileUseCase>();

  final profileEditUsecase = getIt.get<ProfileEditUseCase>();
  final fileUsecase = getIt.get<UploadFilesUseCase>();

  Future<void> getInit({required context, required AppLocalizations t}) async {
    final userProfile = await AppSecureStorage.getProfile();

    if (userProfile != null) {
      emit(state.copyWith(userProfile: userProfile));
      initDataForm(userProfile, context, t);
    }
  }

  Future<void> initDataForm(
      UserProfile userProfile, BuildContext context, AppLocalizations t) async {
    //text controller
    fullNameCT.text = userProfile.fullName ?? "";
    phoneNumberCT.text = userProfile.phoneNumber!.replaceAll(' ', '');
    emailCT.text = userProfile.email ?? "";
    birthdayCT.text = DateTimeUtils.convertDateInit(
        userProfile.dayOfBirth ?? DateFormat('yyyy-MM-dd').format(DateTime.now()).toString());
    genderCT.text = userProfile.gender ?? "";

    initUploadType(context, t);

    emit(state.copyWith(
      gender: genderCT.text,
      avatarUrl: userProfile.avatarFileUrl,
      avatarFileId: userProfile.avatarFileId,
    ));
  }

  Future<void> pickImage(context) async {
    XFile? image = XFile("");
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    String errorText = FileUtils.checkImageValid(File(image!.path), context: context);
    if (Utils.isNullOrEmpty(errorText)) {
      emit(state.copyWith(avatar: File(image.path)));
    } else {
      WidgetUtils.showError(context: context, errorText: errorText);
    }
    return;
  }

  Future<void> initUploadType(context, t) async {
    //upload type init
    List<UploadTypeModel> uploadType = [
      UploadTypeModel(
          icon: AppSvgs.icImageAdd,
          title: t.pick_img_gallery,
          onPress: () async {
            pickImage(context);
          }),
      UploadTypeModel(
          icon: AppSvgs.icCameraAddGrey,
          title: t.use_camera,
          onPress: () async {
            pickImageCamera(context);
          }),
    ];
    emit(state.copyWith(
      uploadType: uploadType,
    ));
  }

  Future<void> pickImageCamera(context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    String errorText = FileUtils.checkImageValid(File(image!.path), context: context);
    if (Utils.isNullOrEmpty(errorText)) {
      emit(state.copyWith(avatar: File(image.path)));
    } else {
      WidgetUtils.showError(context: context, errorText: errorText);
    }
  }

  void setFullName(String value) {
    fullName = FullName.dirty(value);
    emit(state.copyWith(fullName: fullName));
  }

  void setPhoneNumber(String value) {
    phoneNumber = PhoneNumber.dirty(value);
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void setEmail(String value) {
    email = Email.dirty(value);
    emit(state.copyWith(email: email));
  }

  void setBirthDay(DateTime value) {
    emit(state.copyWith(dayOfBirth: value.toString()));
  }

  void setGender(bool isSelected, GenderTypeEnum gender) {
    emit(state.copyWith(gender: gender.name));
  }

  void setAvatarUrl() {
    // state = state.copyWith(avatarFileId: avatarUrl);
  }

  onChooseDay(BuildContext context, DateTime focusedDay, lang) {
    setBirthDay(focusedDay);
    if (focusedDay.isBefore(DateTime.now())) {
      birthdayCT.text = DateTimeUtils.convertDate(focusedDay);
      // Navigator.pop(context);
    } else {
      // Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogCustom(
            title: lang.notify,
            content: lang.validateBirth,
            textBtnAccept: lang.close,
            onPressBtnAccept: () {
              Navigator.of(context).pop();
            },
            showBtnCancel: false,
            onPressBtnCancel: () {},
          );
        },
      );
    }
  }

  Future<void> onSubmit({required context, required AppTheme theme}) async {
    final lang = Utils.languageOf(context);
    Utils.showLoading();
    bool hasAvatar = false;
    //check if has avatar
    if (state.avatar.path != "") {
      await requestUpload();
      hasAvatar = true;
    } else if (state.avatarFileId != "") {
      hasAvatar = true;
    }

    //check avatar and send request
    if (hasAvatar) {
      await requestChangeInfo(context: context, theme: theme);
    } else {
      WidgetUtils.showError(context: context, errorText: lang.please_update_photos);
    }
    Utils.hideLoading();
  }

  Future<void> requestChangeInfo({required context, required AppTheme theme}) async {
    final lang = Utils.languageOf(context);
    Utils.showLoading();

    if (formKeyPE.currentState!.validate()) {
      String dayOfBirth = "";
      if (birthdayCT.text.isNotEmpty) {
        dayOfBirth = DateTimeUtils.convertDateReverse(birthdayCT.text);
      }
      ProfileEditResponse params = ProfileEditResponse(
        fullName: fullNameCT.text,
        phoneNumber: phoneNumberCT.text,
        email: emailCT.text,
        gender: state.gender,
        dayOfBirth: (birthdayCT.text.isNotEmpty) ? dayOfBirth : birthdayCT.text,
        avatarFileId: state.avatarFileId,
      );

      //update infomation
      bool isDone = await profileEditUsecase.requestEditProfile(params);
      if (isDone) {
        //get profile info
        await profileUseCase.requestProfile();

        //show pop up
        WidgetUtils.showSnackBar(context: context, theme: theme, title: lang.updateUserInfoSuccess);
        AppNavigator.pushRoot(Routes.bottomNavigationBar, 3);
      }
      // else {
      //   WidgetUtils.showSnackBar(context: context, theme: theme, title: lang.updateUserInfoFailed);
      // }
    }
    Utils.hideLoading();
  }

  Future<void> requestUpload() async {
    List<File> files = [];

    files.add(state.avatar);
    final result = await fileUsecase.uploadFile(files);

    if (result != null) {
      final id = result.first.id;
      emit(state.copyWith(avatarFileId: id));
    }
  }
}
