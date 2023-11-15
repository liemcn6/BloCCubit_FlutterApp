part of '../profile_edit_screen.dart';

class ProfileEditView extends BaseWidget {
  const ProfileEditView({super.key});

  @override
  onInit(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lang = Utils.languageOf(context);
      context.read<ProfileEditCubit>().getInit(context: context, t: lang);
    });
    return super.onInit(context);
  }

  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ProfileEditCubit>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Header(
            title: t.edit_info,
          )),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimension.padding16),
              child: Form(
                key: cubit.formKeyPE,
                child: Column(
                  children: <Widget>[
                    profileAvatar(context, t, cubit),
                    const SizedBox(
                      height: Dimension.padding16,
                    ),
                    RichText(
                      text: TextSpan(
                        text: t.hello,
                        style: TextStyle(color: theme.colors.textTitle, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                              text: cubit.state.userProfile.fullName ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Dimension.padding24,
                    ),
                    _FullNameField(),
                    _PhoneNumberField(),
                    _EmailField(),
                    _BirthdayField(),
                    _GenderField(),
                  ],
                ),
              ),
            ),
          ),
          ButtonView(
            margin: const EdgeInsets.all(Dimension.margin16),
            onPress: (data) {
              cubit.onSubmit(context: context, theme: theme);
            },
            title: t.save,
          )
        ],
      ),
    );
  }

  Center profileAvatar(BuildContext context, AppLocalizations t, ProfileEditCubit cubit) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return BottomSheetWidget(
                title: t.upload_img,
                iconCloseRight: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: cubit.state.uploadType
                        .asMap()
                        .map(
                          ((key, value) => MapEntry(
                                key,
                                ItemBTSheet(
                                    icon: value.icon,
                                    onPress: value.onPress,
                                    title: value.title,
                                    index: key),
                              )),
                        )
                        .values
                        .toList(),
                  ),
                ),
              );
            },
          );
        },
        child: Stack(
          children: [
            SizedBox(
              child: cubit.state.avatar.path == ""
                  ? ImgNetWork(
                      url: cubit.state.userProfile.avatarFileUrl,
                      blankImage: "assets/images/blank_avatar.png",
                      width: 100,
                      height: 100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(cubit.state.avatar),
                      maxRadius: 50,
                    ),
            ),
            Positioned(bottom: 0, right: 9, child: AppSvgs.icCamera)
          ],
        ),
      ),
    );
  }
}

class _FullNameField extends BaseWidget {
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ProfileEditCubit>();

    return TextsField(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
      borderType: BorderTypes.all,
      controller: cubit.fullNameCT,
      labelText: t.full_name,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      maxLength: 100,
      onChanged: cubit.setFullName,
      validator: (_) =>
          cubit.fullName.validator(_ ?? "") != null ? cubit.fullName.showError(context) : null,
      theme: theme,
    );
  }
}

class _PhoneNumberField extends BaseWidget {
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ProfileEditCubit>();
    final lang = Utils.languageOf(context);

    return TextsField(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
      borderType: BorderTypes.all,
      controller: cubit.phoneNumberCT,
      labelText: lang.phone_number,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      onChanged: cubit.setPhoneNumber,
      validator: (_) =>
          cubit.phoneNumber.validator(_) != null ? cubit.phoneNumber.showError(context) : null,
      theme: theme,
    );
  }
}

class _EmailField extends BaseWidget {
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final cubit = context.watch<ProfileEditCubit>();

    return TextsField(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
      borderType: BorderTypes.all,
      controller: cubit.emailCT,
      labelText: t.email,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      onChanged: cubit.setEmail,
      validator: (_) =>
          cubit.email.validator(_ ?? "") != null ? cubit.email.showError(context) : null,
      theme: theme,
    );
  }
}

class _BirthdayField extends BaseWidget {
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;

    final cubit = context.watch<ProfileEditCubit>();
    // DateTime current = cubit.birthdayCT.text.isNotEmpty
    //     ? DateTime.parse(DateTimeUtils.convertDateReverse(cubit.birthdayCT.text))
    //     : DateTime.now();
    return TextsField(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: Dimension.margin8),
      borderType: BorderTypes.all,
      controller: cubit.birthdayCT,
      labelText: t.birthday,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      theme: theme,
      enabled: false,
      suffixIcon: AppSvgs.icCalendar,
      onTapSuffix: () => showCalendarBottomSheet(
        context: context,
        currentDay: DateTime.parse(DateTimeUtils.convertDateReverse(cubit.birthdayCT.text)),
        lastDay: DateTime.now(),
        onChange: (date) => cubit.onChooseDay(context, date, t),
        mode: CupertinoDatePickerMode.date,
      ),
      autofocus: false,
      onTap: () => showCalendarBottomSheet(
        mode: CupertinoDatePickerMode.date,
        context: context,
        currentDay: DateTime.parse(DateTimeUtils.convertDateReverse(cubit.birthdayCT.text)),
        lastDay: DateTime.now(),
        onChange: (date) => cubit.onChooseDay(context, date, t),
      ),
    );
  }
}

class _GenderField extends BaseWidget {
  @override
  Widget builder(BuildContext context, data, AppCubit appController, AppLocalizations t) {
    final appState = appController.state;
    final theme = appState.theme;
    final lang = Utils.languageOf(context);

    final cubit = context.watch<ProfileEditCubit>();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimension.padding16, vertical: Dimension.padding16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                ),
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: const Color(0xffD8D8D8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            lang.gender,
            style: AppTextStyle.s12.copyWith(color: theme.colors.textLabel),
          ),
          const SizedBox(
            height: Dimension.margin4,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RadioButton<GenderTypeEnum>(
                  isSelected: cubit.state.gender == GenderTypeEnum.MALE.name,
                  value: GenderTypeEnum.MALE,
                  onChange: cubit.setGender,
                  shape: BoxShape.circle,
                  title: lang.male,
                ),
              ),
              Expanded(
                flex: 1,
                child: RadioButton<GenderTypeEnum>(
                  isSelected: cubit.state.gender == GenderTypeEnum.FEMALE.name,
                  value: GenderTypeEnum.FEMALE,
                  onChange: cubit.setGender,
                  shape: BoxShape.circle,
                  title: lang.female,
                ),
              ),
              Expanded(
                flex: 1,
                child: RadioButton<GenderTypeEnum>(
                  isSelected: cubit.state.gender == GenderTypeEnum.OTHER.name,
                  value: GenderTypeEnum.OTHER,
                  onChange: cubit.setGender,
                  shape: BoxShape.circle,
                  title: lang.other,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
