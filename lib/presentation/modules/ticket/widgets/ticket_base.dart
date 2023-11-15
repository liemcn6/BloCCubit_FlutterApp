import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/ticket/ticket_status.dart';
import 'package:home_care/presentation/widgets/bottom_sheet_widget.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/common_widget.dart';
import 'package:home_care/presentation/widgets/file_preview.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

class TicketBase {
  final AppTheme theme;
  final BuildContext baseContext;
  final AppLocalizations lang;
  final double width;

  TicketBase({
    required this.theme,
    required this.baseContext,
    required this.lang,
    required this.width,
  });

  Widget _renderStarIcon({
    bool isSmall = false,
    required int selectPos,
    required int currentPos,
  }) {
    final fullStar = isSmall ? AppSvgs.icStarSmall : AppSvgs.icStar;
    final halfStar = isSmall ? AppSvgs.icStarHalfSmall : AppSvgs.icStarHalf;
    final borderStar = isSmall ? AppSvgs.icStarOutlineSmall : AppSvgs.icStarOutline;
    var starView = fullStar;
    final check2 = currentPos + 0.2;
    final check3 = currentPos + 0.8;

    if (selectPos <= check2) {
      starView = borderStar;
    } else if (check2 < selectPos && selectPos <= check3) {
      starView = halfStar;
    } else if (selectPos > check3) {
      starView = fullStar;
    }
    return starView;
  }

  ///star rating item
  Widget starRatingItem({
    bool isSmall = false,
    required int selectPos,
    required int currentPos,
    Function()? onTap,
    EdgeInsets? padding,
  }) {
    return CardView(
      padding: padding ?? const EdgeInsets.all(Dimension.padding8),
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      onTap: onTap,
      child: _renderStarIcon(
        isSmall: isSmall,
        selectPos: selectPos,
        currentPos: currentPos,
      ),
    );
  }

  ///star rating row
  Widget starRatingRow({
    int? selectPos = 5,
    Function(int pos)? onTap,
    bool isSmall = false,
    EdgeInsets? paddingItem,
    bool isHide = false,
  }) {
    return Visibility(
      visible: !isHide,
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            starRatingItem(
              selectPos: selectPos ?? 0,
              currentPos: i,
              padding: paddingItem,
              onTap: onTap != null
                  ? () {
                      onTap(i.toInt() + 1);
                    }
                  : null,
              isSmall: isSmall,
            ),
        ],
      ),
    );
  }

  Widget itemColViewBS({
    bool noBottomBorder = false,
    String title = '',
    required bool isSel,
    Function()? onTap,
  }) {
    return CardView(
      color: Colors.transparent,
      radius: 0,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
        margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
        decoration: BoxDecoration(
          border: noBottomBorder
              ? null
              : Border(
                  bottom: BorderSide(width: 1, color: theme.colors.border),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyle.s16w400cBlack),
            // AppUtils.isNullOrEmpty(selectId)?
            Visibility(
              visible: isSel,
              child: Icon(Icons.check, color: theme.colors.primary),
            ),
          ],
        ),
      ),
    );
  }

  ///Show bottom sheet has list data as column
  Future showColumnViewBS({
    required List<RowItem> list,
    Function(RowItem data)? onTap,
    bool isService = false,
    String? title,
    String? selectId,
  }) {
    return showModalBottomSheet(
      context: baseContext,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var listCheck = list;
        for (int i = 0; i < list.length; i++) {
          if (list[i].id == selectId) {
            listCheck[i] = list[i].copyWith(isSelected: true);
          } else {
            listCheck[i] = list[i].copyWith(isSelected: false);
          }
        }
        return BottomSheetWidget(
          title: title,
          showIconClose: true,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: DeviceUtils.getHeight(context) / 4 * 3,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                for (var i = 0; i < listCheck.length; i++)
                  itemColViewBS(
                    noBottomBorder: i == listCheck.length - 1 ? true : false,
                    title: isService
                        ? lang.building_services(listCheck[i].name!)
                        : listCheck[i].name ?? '',
                    isSel: listCheck[i].isSelected ?? false,
                    onTap: () {
                      if (!Utils.isNullOrEmpty(onTap)) {
                        if (listCheck[i].isSelected ?? false) {
                          onTap!(const RowItem());
                        } else {
                          onTap!(listCheck[i]);
                        }
                      }
                      Navigator.pop(context);
                    },
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  ///Show bottom sheet has list data as grip
  Future showGripViewBS({
    required List<RowItem> list,
    Function(RowItem data)? onTap,
    String? title,
    int? selectId,
  }) {
    return showModalBottomSheet(
      context: baseContext,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetWidget(
          title: title,
          showIconClose: true,
          child: Container(
            constraints: BoxConstraints(maxHeight: DeviceUtils.getHeight(context) * 2 / 3),
            child: GridView.count(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              primary: false,
              padding: const EdgeInsets.all(Dimension.padding8),
              childAspectRatio: (DeviceUtils.getWidth(context) - 16 * 4) / (44 * 3),
              crossAxisCount: 3,
              children: <Widget>[
                for (var i = 0; i < list.length; i++)
                  CardView(
                    margin: const EdgeInsets.all(Dimension.margin8),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    color: list[i].isSelected ?? false
                        ? theme.colors.primary
                        : theme.colors.background,
                    title: list[i].name ?? '',
                    titleStyle: AppTextStyle.s16w400cWhite.copyWith(
                      color: list[i].isSelected ?? false ? Colors.white : theme.colors.primary,
                    ),
                    alignment: Alignment.center,
                    onTap: () {
                      if (!Utils.isNullOrEmpty(onTap)) {
                        onTap!(list[i]);
                      }
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///Show bottom sheet has list data as column
  Future pickerImage({
    required Function() onTapCamera,
    required Function()? onTapGallery,
    Function()? onTapDocument,
    String? titleBottom,
    bool disableCamera = false,
  }) {
    return showModalBottomSheet(
      context: baseContext,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BottomSheetWidget(
          title: titleBottom ?? lang.document,
          showIconClose: true,
          iconCloseRight: true,
          child: Column(
            children: [
              Visibility(
                visible: onTapDocument != null,
                child: renderItem(
                  context,
                  title: lang.document,
                  onTap: onTapDocument,
                  icon: Icons.file_present,
                ),
              ),
              Visibility(
                visible: onTapGallery != null,
                child: renderItem(
                  context,
                  title: lang.image_gallery,
                  onTap: onTapGallery,
                  icon: Icons.image_outlined,
                ),
              ),
              renderItem(
                context,
                title: lang.use_camera,
                onTap: onTapCamera,
                icon: Icons.camera_alt_outlined,
              )
            ],
          ),
        );
      },
    );
  }

  CardView renderItem(
    BuildContext context, {
    Function()? onTap,
    required IconData icon,
    required String title,
  }) {
    return CardView(
      color: Colors.transparent,
      radius: 0,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: Dimension.margin16),
      padding: const EdgeInsets.symmetric(vertical: Dimension.padding16),
      onTap: () {
        Navigator.pop(context);

        if (!Utils.isNullOrEmpty(onTap)) {
          onTap!();
        }
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyle.s14w400cBlack,
          ),
        ],
      ),
    );
  }

  Widget preview({
    required ImageModel image,
  }) {
    if (image.type == ImageType.network && image.networkData != null) {
      bool isImage = FileUtils(image.networkData!.originalName ?? '').isImage;

      if (isImage) {
        return ImgNetWork(
          url: image.networkData!.viewUrl,
          borderRadius: BorderRadius.circular(4),
          height: width * 0.25,
          width: width * 0.25,
        );
      }

      return Container(
        width: width * 0.25,
        height: width * 0.25,
        decoration: BoxDecoration(
          color: theme.colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: theme.colors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.description,
              size: 24,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                image.networkData!.originalName ?? '',
                style: const TextStyle(fontSize: 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    if (image.file != null) {
      final isImage = FileUtils(image.file!.path).isImage;

      if (isImage) {
        return Image.file(
          image.file!,
          height: width * 0.25,
          width: width * 0.25,
          fit: BoxFit.cover,
        );
      }

      return Container(
        width: width * 0.25,
        height: width * 0.25,
        decoration: BoxDecoration(
          color: theme.colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: theme.colors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.description,
              size: 24,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                FileUtils(image.file!.path).fileName,
                style: const TextStyle(fontSize: 8),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }

  Widget imageView({
    required ImageModel image,
    required int pos,
    Function()? onDel,
    Function()? onTap,
    bool isDelIconShow = true,
  }) {
    return CardView(
      margin: const EdgeInsets.only(right: Dimension.padding8),
      padding: EdgeInsets.zero,
      radius: 6,
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          preview(image: image),
          Visibility(
            visible: !Utils.isNullOrEmpty(onDel) && isDelIconShow == true,
            child: CardView(
              onTap: onDel,
              padding: const EdgeInsets.all(4),
              margin: EdgeInsets.zero,
              color: Colors.black.withOpacity(0.3),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addImageView({
    required List<ImageModel> images,
    required Function() onTapCamera,
    required Function()? onTapGallery,
    Function()? onTapDocument,
    int maxFiles = 5,
    String? titleBottom,
  }) {
    return CardView(
      onTap: images.length >= maxFiles
          ? null
          : () {
              if (onTapGallery == null && onTapDocument == null) {
                onTapCamera.call();
                return;
              }

              pickerImage(
                titleBottom: titleBottom,
                onTapCamera: onTapCamera,
                onTapGallery: onTapGallery,
                onTapDocument: onTapDocument,
              );
            },
      setMinWidth: true,
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(0, Dimension.margin8, Dimension.margin8, Dimension.margin8),
      child: DottedBorder(
        color: theme.colors.primary,
        strokeWidth: 1,
        dashPattern: const [6, 6],
        radius: const Radius.circular(4),
        borderType: BorderType.RRect,
        child: SizedBox(
          width: width * 0.25,
          height: width * 0.25,
          child: Center(child: AppSvgs.icGalleryAdd),
        ),
      ),
    );
  }

  Widget imageAddListView({
    String? title,
    String? note,
    String? titleBottom,
    bool isRequired = false,
    required List<ImageModel> images,
    required Function() onTapCamera,
    Function()? onTapGallery,
    required Function(int i) onDel,
    bool disableCamera = false,
    Function()? onTapDocument,
    int maxFiles = 5,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: Dimension.padding16,
    ),
    bool isShowCameraRequired = false,
    bool isShowCameraIcon = true,
    bool isDelIconShow = true,
  }) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Text.rich(
              TextSpan(
                text: title ?? lang.image,
                style: AppTextStyle.s14w400cBlack,
                children: <TextSpan>[
                  isRequired
                      ? TextSpan(
                          text: ' *',
                          style: AppTextStyle.s14.copyWith(color: theme.colors.red),
                        )
                      : const TextSpan(),
                ],
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Visibility(
            visible: note != null,
            child: Text(
              note ?? lang.image_note,
              style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: isShowCameraRequired == true && images.isEmpty
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isShowCameraIcon,
                  child: addImageView(
                    titleBottom: titleBottom,
                    maxFiles: maxFiles,
                    images: images,
                    onTapCamera: onTapCamera,
                    onTapGallery: onTapGallery,
                    onTapDocument: onTapDocument,
                  ),
                ),
                for (int i = 0; i < images.length; i++)
                  imageView(
                    image: images[i],
                    pos: i,
                    isDelIconShow: isDelIconShow,
                    onDel: () {
                      onDel(i);
                    },
                    onTap: () {
                      showFilePreviewList(
                        files: images,
                        context: baseContext,
                        initialPage: i,
                        onDel: (vt) {
                          onDel(vt);
                        },
                      );
                    },
                  ),
                Visibility(
                  visible: isShowCameraRequired == true && images.isEmpty,
                  child: Text(
                    '*',
                    style: AppTextStyle.s16wBoldcRed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statusView(String? status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lang.status,
          style: TextStyle(fontSize: 12, color: theme.colors.gray700),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        CommonWidget.badge(
          TicketStatus.convertTicketStatusToString(
            lang: lang,
            status: status,
          ),
          TicketStatus.convertTextColorTicketStatus(
            status,
            theme.colors,
          ),
          TicketStatus.convertBGColor2TicketStatus(
            status,
            theme.colors,
          ),
        ),
      ],
    );
  }

  Widget itemBorderView({
    required String title,
    String? hintTitle,
    String? value,
    String? errorText,
    bool isShowError = false,
    bool isDisable = false,
    VoidCallback? onTap,
    double marginBottom = 0,
    double marginTop = Dimension.margin16,
    double marginRight = 16,
    double marginLeft = 16,
    Widget? icon,
    bool isRequired = false,
    bool isCalendar = false,
  }) {
    return Column(
      children: [
        CardView(
          color: Colors.white,
          onTap: isDisable ? null : onTap,
          padding: const EdgeInsets.all(Dimension.padding12),
          margin: EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: isShowError ? 0 : marginBottom,
          ),
          border: Border.all(color: theme.colors.gray400),
          radius: Dimension.radius8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.isNullOrEmpty(value) ? Dimension.padding12 : 0,
                      ),
                      child: Utils.isNullOrEmpty(value)
                          ? Text.rich(
                              TextSpan(
                                text: hintTitle ?? title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: theme.colors.gray700,
                                ),
                                children: <TextSpan>[
                                  isRequired
                                      ? TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: theme.colors.red,
                                          ),
                                        )
                                      : const TextSpan(),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : Text.rich(
                              TextSpan(
                                text: title,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colors.gray700,
                                ),
                                children: <TextSpan>[
                                  isRequired
                                      ? TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: theme.colors.red,
                                          ),
                                        )
                                      : const TextSpan(),
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                    ),
                    Visibility(
                      visible: !Utils.isNullOrEmpty(value),
                      child: Text(
                        value ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: Dimension.padding8),
                child: icon ??
                    (isCalendar
                        ? AppSvgs.icCalendar
                        : const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 28,
                          )),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isShowError,
          child: Container(
            padding: const EdgeInsets.only(
              top: Dimension.padding4,
              right: Dimension.padding4,
              left: Dimension.padding4,
            ),
            margin: EdgeInsets.only(
              left: Dimension.margin16,
              right: Dimension.margin16,
              bottom: marginBottom,
            ),
            child: Text(
              errorText ?? '',
              style: TextStyle(fontSize: 14, color: theme.colors.error),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
