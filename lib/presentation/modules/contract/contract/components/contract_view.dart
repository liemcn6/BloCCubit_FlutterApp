part of '../contract_screen.dart';

class ContractView extends StatefulWidget {
  const ContractView({super.key});

  @override
  State<ContractView> createState() => _ContractViewState();
}

class _ContractViewState extends State<ContractView> {
  late ContractCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ContractCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.initData(context);
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
        preferredSize: const Size.fromHeight(180),
        child: LargeHeader(
          title: t.contract,
          // visibleBack: false,
          image: AppImages.contractHeader,
        ),
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        buildWhen: (previous, current) {
          final listContracts = previous.listContracts != current.listContracts;
          final enableLoadMore = previous.enableLoadMore != current.enableLoadMore;
          final filter = previous.filter != current.filter;
          return listContracts || enableLoadMore || filter;
        },
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return RefreshIndicator(
                onRefresh: () => _cubit.onRefresh(context),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    maxHeight: constraints.maxHeight,
                  ),
                  child: ListWidget(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    itemCount: state.listContracts?.length ?? 0,
                    // emptyWidget: renderEmptyWidget(),
                    enableLoadMore: state.enableLoadMore ?? false,
                    onLoadMore: () => _cubit.onLoadMore(context),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ItemContract(
                          index: index,
                          onPress: () async {
                            await AppNavigator.push(
                                Routes.contractDetail, _cubit.state.listContracts?[index].id ?? '');
                          },
                          item: state.listContracts![index],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
