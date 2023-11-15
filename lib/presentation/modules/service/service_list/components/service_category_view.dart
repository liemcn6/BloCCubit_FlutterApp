part of '../service_list_screen.dart';

class ServiceCategoryView extends StatelessWidget {
  final AppTheme theme;
  final AppLocalizations t;
  final ServiceListState state;

  const ServiceCategoryView({super.key, required this.theme, required this.t, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [_gridViewCategories(context, false)],
        ),
        _listRecent(context),
      ],
    );
  }

  _listRecent(BuildContext context) {
    return Column(
      children: state.serviceRecent
          .map<Widget>((item) => CardImageView(
                theme: theme,
                tr: t,
                title: item.name,
                content: "${item.areaName}, ${item.buildingName}, ${item.unitName}",
                image: ImageModel(
                  networkData: file_image.IllustrationFile(
                    id: item.illustrationFile?.id,
                    viewUrl: item.illustrationFile?.viewUrl,
                    downloadUrl: item.illustrationFile?.viewUrl,
                    originalName: item.illustrationFile?.originalName,
                  ),
                ),
                id: item.id ?? "",
                onTapItem: (id) async {
                  await UtilsService.showRegisterBottomSheet(
                      context, theme, context.read<ServiceDetailCubit>(), t,
                      id: id);
                },
              ))
          .toList(),
    );
  }

  _gridViewCategories(BuildContext context, bool isBottomFull) {
    var data = state.serviceList.data;
    bool hasOther = false;
    if (data.length > 6 && !isBottomFull) {
      hasOther = true;
      data = data.sublist(0, 5);
      data.add(ServiceListData(id: '-1', name: t.other, viewUrl: ''));
    }
    return GridView.count(
      padding: const EdgeInsets.only(top: 25),
      shrinkWrap: true,
      physics: isBottomFull
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      children: _listGridView(context, data, hasOther, state),
    );
  }

  _listGridView(
      BuildContext context, List<ServiceListData> data, bool hasOther, ServiceListState state) {
    return data.map<Widget>((item) {
      bool isOther = hasOther && item.id == '-1';
      return GestureDetector(
        onTap: () {
          if (isOther) {
            _showModalBottomSheet(context);
          } else {
            AppNavigator.push(Routes.serviceDetail, {
              "buildingId": AppStorage().buildingList.first.id,
              "facilityGroupIds": item.id,
              "nameScreen": item.name
            });
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              (isOther)
                  ? Image.asset(AppImages.icOther.assetName, width: 48)
                  : ImgNetWork(
                      url: item.viewUrl,
                      blankImage: AppImages.blankAvatar.assetName,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      width: 48,
                      height: 48,
                    ),
              const SizedBox(height: 8),
              Text(
                item.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.s14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: theme.colors.neutralDark13,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimension.padding12),
                    topRight: Radius.circular(Dimension.padding12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: Dimension.padding48,
                    ),
                    Expanded(
                      child: Text(
                        t.list_of_services,
                        style: AppTextStyle.s16w400cWhite.copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CardView(
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          // width: 48.0, // Set the desired width
                          height: 48.0, // Set the desired height
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                theme.colors.white, BlendMode.srcIn), // Change the color to red
                            child: AppSvgs.icClose,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(child: _gridViewCategories(context, true)),
            ],
          );
        });
  }
}
