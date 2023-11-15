part of '../profile_info_screen.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  late ProfileInfoCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<ProfileInfoCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getInit(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppCubit>();
    final t = Utils.languageOf(context);
    final appState = controller.state;
    final theme = appState.theme;
    final cubit = context.watch<ProfileInfoCubit>();
    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Dimension.padding56),
          child: Header(
            title: t.personal_information,
            // visibleBack: false,
          )),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimension.padding16),
              child: Column(children: <Widget>[
                Center(
                  child: ImgNetWork(
                    url: cubit.state.userProfile.avatarFileUrl,
                    // blankImage: "assets/images/blank_avatar.png",
                    blankImage: AppImages.blankAvatar.assetName,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: Dimension.padding16,
                ),
                RichText(
                  text: TextSpan(
                    text: t.hello,
                    style: AppTextStyle.s16w400cBlack.copyWith(color: theme.colors.textTitle),
                    children: <TextSpan>[
                      TextSpan(
                          text: cubit.state.userProfile.fullName ?? '',
                          style: AppTextStyle.s16w400cBlack.copyWith(
                              fontWeight: FontWeight.w600, color: theme.colors.textTitle)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Dimension.padding24,
                ),
                profileInfoDetails(theme, t, cubit),
              ]),
            ),
          ),
          ButtonView(
            // height: Dimension.padding44,
            margin: const EdgeInsets.all(Dimension.margin16),
            onPress: (value) => AppNavigator.push(Routes.profileEdit),
            title: t.update,
          ),
        ],
      ),
    );
  }

  //show profile info details
  profileInfoDetails(AppTheme theme, AppLocalizations t, ProfileInfoCubit cubit) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: theme.colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemInfoView(
            label: t.full_name,
            value: cubit.state.userProfile.fullName ?? "N/A",
          ),
          // Visibility(
          //   visible: cubit.state.userProfile.organization?.name != null &&
          //       cubit.state.userProfile.accountType == AccountType.customer,
          //   child: ItemInfoView(
          //     visible: cubit.state.userProfile.organization?.name != null &&
          //         cubit.state.userProfile.accountType == AccountType.customer,
          //     label: t.company,
          //     value: cubit.state.userProfile.organization?.name ?? "N/A",
          //   ),
          // ),
          ItemInfoView(
            label: t.phone_number,
            value: cubit.state.userProfile.phoneNumber ?? "",
          ),
          ItemInfoView(
            label: t.email,
            value: cubit.state.userProfile.email ?? '',
          ),
          ItemInfoView(
            label: t.birthday,
            value: cubit.state.userProfile.dayOfBirth != null
                ? DateTimeUtils.convertDate(cubit.state.userProfile.dayOfBirth)
                : '',
          ),
          ItemInfoView(
            label: t.gender,
            value: cubit.state.userProfile.gender == GenderTypeEnum.MALE.name
                ? t.male
                : cubit.state.userProfile.gender == GenderTypeEnum.FEMALE.name
                    ? t.female
                    : t.other,
            isDividerVisible: false,
          ),
        ],
      ),
    );
  }
}
