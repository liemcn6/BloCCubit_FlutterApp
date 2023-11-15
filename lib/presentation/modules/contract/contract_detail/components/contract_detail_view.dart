part of '../contract_detail_screen.dart';

class ContractDetailView extends StatefulWidget {
  final String contractId;

  const ContractDetailView({super.key, required this.contractId});

  @override
  State<ContractDetailView> createState() => _ContractDetailViewState();
}

class _ContractDetailViewState extends State<ContractDetailView> {
  final GlobalKey<FormState> _formKeyDT = GlobalKey<FormState>();
  late ContractDetailCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ContractDetailCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getInit(context, contractId: widget.contractId);
    });
    super.initState();
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
    final t = Utils.languageOf(context);
    return Scaffold(
      backgroundColor: theme.colors.newBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Dimension.padding56),
        child: Header(
          title: t.contractDetail,
          visibleBack: true,
          actions: [
            IconHome(onTapIcon: () {
              int count = 0;
              Navigator.popUntil(context, (route) => count++ >= 2);
            }),
          ],
        ),
      ),
      body: BlocBuilder<ContractDetailCubit, ContractDetailState>(
        buildWhen: (previous, current) {
          final contractDetail = previous.contractDetail != current.contractDetail;
          return contractDetail;
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(Dimension.padding16),
            child: Form(
              key: _formKeyDT,
              child: RefreshIndicator(
                onRefresh: () => _cubit.handlerRefresh(context, widget.contractId),
                child: (Utils.isNullOrEmpty(state.contractDetail))
                    ? ListView(
                        children: [
                          emptyBody(context, t),
                        ],
                      )
                    : ListView(
                        physics:
                            const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          renderGeneralBody(context, t),
                          renderUnitBody(t),
                          renderPriceBody(t),
                          const SizedBox(height: Dimension.padding20)
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemView({
    String title = '',
    dynamic value,
    String? type,
    String? unitType,
  }) {
    return Visibility(
      visible: !Utils.isNullOrEmpty(value),
      child: Padding(
        padding: const EdgeInsets.only(bottom: Dimension.padding12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                title,
                style: AppTextStyle.s16w400cBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                StringUtils.valueText(value, type: type, unit: unitType),
                style: AppTextStyle.s16w400cBlack,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderGeneralBody(BuildContext context, AppLocalizations lang) {
    final appController = context.watch<AppCubit>();
    final theme = appController.state.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppSvgs.icContractInfo,
            const SizedBox(width: Dimension.padding4),
            Text(
              lang.generalInfo,
              style: AppTextStyle.s16w400cBlack
                  .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.padding8),
            color: theme.colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemInfoView(
                label: lang.contractCode,
                value: _cubit.state.contractDetail?.contractNumber ?? "",
              ),
              ItemInfoView(
                label: lang.effectFrom,
                value: DateTimeUtils.formatDateTime(
                      DateTime.tryParse(_cubit.state.contractDetail?.effectiveDate ?? '')
                          ?.millisecondsSinceEpoch,
                      DateTimeUtils.dd_MM_yyyy,
                    ) ??
                    "",
              ),
              ItemInfoView(
                label: lang.expire,
                value: DateTimeUtils.formatDateTime(
                      DateTime.tryParse(_cubit.state.contractDetail?.expirationDate ?? '')
                          ?.millisecondsSinceEpoch,
                      DateTimeUtils.dd_MM_yyyy,
                    ) ??
                    "",
              ),
              ItemInfoView(
                label: lang.status,
                widgetChild: renderStatus(context, _cubit.state.contractDetail),
                // value: GetValueStatuses.getNameWithLang(
                //     context, _cubit.state.contractDetail?.viewStatus ?? ''),
              ),
              ItemInfoView(
                label: lang.paymentPeriod,
                value: StringUtils.valueText(_cubit.state.contractDetail?.periodPayment,
                    type: ValueType.addUnit.name,
                    unit: (Utils.isNullOrEmpty(_cubit.state.contractDetail?.periodPayment))
                        ? ''
                        : (_cubit.state.contractDetail!.periodPayment! > 1)
                            ? lang.months
                            : lang.month),
              ),
              ItemInfoView(
                label: lang.deposit,
                value: StringUtils.valueText(_cubit.state.contractDetail?.deposit,
                    type: ValueType.money.name, unit: null),
                isDividerVisible: false,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimension.margin16,
        )
      ],
    );
  }

  Widget renderStatus(BuildContext context, ContractDetailModel? item) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color:
                GetValueStatuses.getStatuses(item?.viewStatus ?? "").colorStatuses.withOpacity(0.6),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            GetValueStatuses.getNameWithLang(context, item?.viewStatus ?? ""),
            style: TextStyle(
              color: GetValueStatuses.getStatuses(item?.viewStatus ?? "").colorText,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget renderUnitBody(AppLocalizations lang) {
    final appController = context.watch<AppCubit>();
    final theme = appController.state.theme;
    return Visibility(
      visible: !Utils.isNullOrEmpty(_cubit.state.contractDetail?.leasingUnits),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Dimension.padding16),
            child: Row(
              children: [
                AppSvgs.icContractGround,
                const SizedBox(width: Dimension.padding4),
                Text(
                  lang.groundInfo,
                  style: AppTextStyle.s16w400cBlack
                      .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          for (LeasingUnitModel val in _cubit.state.contractDetail?.leasingUnits ?? [])
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
              margin: const EdgeInsets.only(bottom: Dimension.padding16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.padding8),
                color: theme.colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemInfoViewReverse(
                      label: StringUtils.convertGroundNameToString(
                        floor: val.floorName ?? 'N/A',
                        buildingName: val.unitName ?? 'N/A',
                      ),
                      value:
                          "${lang.area} ${StringUtils.valueText(val.area, type: ValueType.addUnit.name, unit: 'm2')}")
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget renderPriceBody(AppLocalizations lang) {
    final appController = context.watch<AppCubit>();
    final theme = appController.state.theme;
    return Visibility(
      visible: !Utils.isNullOrEmpty(_cubit.state.contractDetail?.leasingPrices),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Dimension.padding16),
            child: Row(
              children: [
                AppSvgs.icContractFinance,
                const SizedBox(width: Dimension.padding4),
                Text(
                  lang.economicInfo,
                  style: AppTextStyle.s16w400cBlack
                      .copyWith(color: theme.colors.textTitle, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          for (LeasingPriceModel val in _cubit.state.contractDetail?.leasingPrices ?? [])
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: Dimension.padding16),
              margin: const EdgeInsets.only(bottom: Dimension.padding16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.padding8),
                color: theme.colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemInfoView(
                    label: lang.serviceName,
                    value: val.name ?? "",
                  ),
                  ItemInfoView(
                    label: lang.ground,
                    value: val.serviceTypeUnit ?? "",
                  ),
                  ItemInfoView(
                    label: lang.unit,
                    value: val.unitName ?? "",
                  ),
                  ItemInfoView(
                    label: lang.price,
                    value: StringUtils.valueText(val.unitPrice,
                        type: ValueType.money.name, unit: null),
                    isDividerVisible: false,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget emptyBody(BuildContext context, AppLocalizations lang) {
    return Container(
      height: DeviceUtils.getHeight3(context),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.empty.assetName),
          const SizedBox(
            height: Dimension.padding16,
          ),
          Text(lang.emptyData, style: AppTextStyle.s16wBoldEmptyL),
        ],
      ),
    );
  }
}
