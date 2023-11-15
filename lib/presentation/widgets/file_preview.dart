import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/widgets/card_view.dart';
import 'package:home_care/presentation/widgets/image_network.dart';
import 'package:home_care/presentation/widgets/pdf_viewer.dart';

Future showFilePreviewList({
  required List<ImageModel> files,
  required BuildContext context,
  TextStyle? titleStyle,
  int initialPage = 0,
  Function(int i)? onDel,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 300),
    //thời gian xuất hiện và ẩn đi của hộp thoại
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.9),
    pageBuilder: (context, _, __) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PreviewImageList(
            images: files,
            titleStyle: titleStyle,
            initialPage: initialPage,
            onDel: onDel,
          ),
        ],
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve:
              Curves.easeOut, //check thư viện curves để lựa chọn kiểu xuất hiện /đóng của hộp thoại
        ),
        child: child,
      );
    },
  );
}

class PreviewImageList extends StatefulWidget {
  const PreviewImageList({
    super.key,
    required this.images,
    this.initialPage = 0,
    this.titleStyle,
    this.onDel,
  });

  final Function(int i)? onDel;
  final List<ImageModel> images;
  final int initialPage;
  final TextStyle? titleStyle;

  @override
  State<PreviewImageList> createState() {
    // TODO: implement createState
    return PreviewImageListState();
  }
}

class PreviewImageListState extends State<PreviewImageList> {
  int currentIndex = 0;
  final controller = CarouselController();

  @override
  void initState() {
    currentIndex = widget.initialPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = DeviceUtils.getSize(context);
    final statusBar = DeviceUtils.getStatusBarHeight(context);
    final lang = Utils.languageOf(context);

    return Stack(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: size.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            initialPage: currentIndex,
            // autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: widget.images
              .map(
                (item) => Center(
                  child: _preview(item: item, size: size),
                ),
              )
              .toList(),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          height: statusBar + kToolbarHeight,
          padding: EdgeInsets.only(top: statusBar),
          child: Row(
            children: [
              CardView(
                onTap: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Expanded(
                child: CardView(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.zero,
                  color: Colors.transparent,
                  title: '${currentIndex + 1}/${widget.images.length}',
                  titleStyle: widget.titleStyle ?? AppTextStyle.s16w400cWhite,
                ),
              ),
              const CardView(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: !Utils.isNullOrEmpty(widget.onDel),
          child: Positioned(
            top: size.height - 100,
            left: size.width - 70,
            right: 0,
            child: CardView(
              setMinWidth: true,
              onTap: () {
                widget.onDel!(currentIndex);
                Navigator.pop(context);
              },
              margin: const EdgeInsets.only(right: 16),
              radius: 8,
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    lang.delete,
                    style: widget.titleStyle ?? AppTextStyle.s16w400cWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _preview({
    required ImageModel item,
    required Size size,
  }) {
    if (item.type == ImageType.network && !Utils.isNullOrEmpty(item.networkData)) {
      final f = FileUtils(item.networkData!.originalName ?? '');

      if (f.isImage) {
        return ImgNetWork(
          url: item.networkData!.viewUrl,
          width: size.width,
          fit: BoxFit.contain,
          // height: size.height,
        );
      }

      if (f.isPDF) {
        return PdfViewer(url: item.networkData!.viewUrl);
      }

      return PdfViewer(
        downloadUrl: item.networkData!.downloadUrl,
        fileType: f.fileType,
      );
    }

    if (!Utils.isNullOrEmpty(item.file)) {
      final f = FileUtils(item.file!.path);

      if (f.isImage) {
        return Image.file(
          File(item.file!.path),
          width: size.width,
          fit: BoxFit.contain,
        );
      }

      if (f.isPDF) {
        return PdfViewer(file: item.file!);
      }

      return const PdfViewer();
    }

    return Container();
  }
}
