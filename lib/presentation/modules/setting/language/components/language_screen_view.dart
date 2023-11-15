part of '../language_screen.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  late ChangeLanguageCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ChangeLanguageCubit>();
    super.initState();
    _cubit.initData();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appController = context.watch<AppCubit>();
    final theme = appController.state.theme;
    final lang = Utils.languageOf(context);

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Header(
          title: lang.language,
          visibleBack: true,
          actions: [
            IconHome(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimension.margin16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lang.selectLanguage,
              style: AppTextStyle.s16w400cBlack.copyWith(
                color: theme.colors.textTitle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.only(top: Dimension.margin16),
              child: Column(
                children: [
                  renderItemLanguage(
                    language: LanguageType.vietnamese,
                  ),
                  const HrWidget(
                    margin: EdgeInsets.symmetric(horizontal: Dimension.margin16),
                  ),
                  renderItemLanguage(
                    language: LanguageType.english,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderItemLanguage({
    required AppLanguage language,
  }) {
    final appController = context.read<AppCubit>();
    final theme = appController.state.theme;
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () async {
              await appController.onChangeLanguage(language.locale);
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  language.flag ?? const SizedBox.shrink(),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      language.name ?? "",
                      style: AppTextStyle.s16wBoldBlack.copyWith(color: theme.colors.textTitle),
                    ),
                  ),
                  CheckboxCustom(
                    value: appController.state.locale == language.locale,
                    onChange: (value) async {
                      await appController.onChangeLanguage(language.locale);
                    },
                    shape: BoxShape.circle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
