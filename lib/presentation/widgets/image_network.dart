import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/presentation/widgets/brand_loading.dart';

const String _noImageLink = 'https://opencity.evotek.vn/assets/images/no-image.jpg';

class ImgNetWork extends StatelessWidget {
  const ImgNetWork({
    super.key,
    this.url,
    this.onPress,
    required this.width,
    this.height,
    this.fit,
    this.alignment,
    this.filterQuality,
    this.repeat,
    this.color,
    this.useOldImageOnUrlChange,
    this.margin,
    this.borderRadius,
    this.border,
    this.shadow,
    this.blankImage,
  });

  final String? url;
  final void Function()? onPress;
  final double width;
  final double? height;
  final BoxFit? fit;
  final Alignment? alignment;
  final FilterQuality? filterQuality;
  final ImageRepeat? repeat;
  final Color? color;
  final bool? useOldImageOnUrlChange;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final String? blankImage;

  String? getImgUrlWithEncryptToken() {
    if (url == null || url?.isEmpty == true) {
      return null;
    }

    final token = AppStorage().imgEncToken;

    if (token == null || token.isEmpty == true) {
      return null;
    }

    return "$url?secret=$token";
  }

  @override
  Widget build(BuildContext context) {
    final imgUrl = getImgUrlWithEncryptToken();

    if (Utils.isNullOrEmpty(imgUrl)) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: shadow,
          border: border,
          color: Colors.grey,
        ),
        clipBehavior: Clip.antiAlias,
        child: blankImage != null
            ? Image.asset(blankImage!)
            : Image.network(
                _noImageLink,
                fit: BoxFit.cover,
              ),
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: CachedNetworkImage(
        imageUrl: imgUrl!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        placeholder: (context, url) => _renderLoading(),
        repeat: repeat ?? ImageRepeat.noRepeat,
        imageBuilder: (context, imageProvider) => Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: shadow,
            border: border,
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        color: color,
        useOldImageOnUrlChange: useOldImageOnUrlChange ?? false,
        errorWidget: (context, url, error) {
          return blankImage != null
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Image.asset(
                    blankImage!,
                    width: width,
                    height: height,
                  ),
                )
              : Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    boxShadow: shadow,
                    border: border,
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    _noImageLink,
                    fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }

  Container _renderLoading() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadow,
        border: border,
        color: Colors.grey,
      ),
      child: BrandLoading(size: width * 0.35),
    );
  }
}
