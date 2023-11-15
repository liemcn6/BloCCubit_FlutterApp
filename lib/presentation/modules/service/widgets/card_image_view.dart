import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/file/image_model.dart';
import 'package:home_care/presentation/widgets/image_network.dart';

class CardImageView extends StatelessWidget {
  final AppTheme theme;
  final AppLocalizations tr;
  final String? title;
  final String? content;
  final ImageModel? image;
  final String id;
  final ValueChanged<String>? onTapItem;

  const CardImageView({
    super.key,
    required this.theme,
    required this.tr,
    this.title,
    this.content,
    required this.id,
    this.image,
    this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimension.padding16),
      child: InkWell(
        onTap: () async {
          onTapItem?.call(id);
        },
        borderRadius: BorderRadius.circular(Dimension.radius8),
        splashColor: theme.colors.primary.withOpacity(0.3),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: Dimension.h178,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimension.radius8),
                child: ImgNetWork(
                  url: image?.networkData?.viewUrl,
                  width: 100,
                ),
              ),
            ),
            Container(
              height: 64,
              //width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Dimension.radius8),
                  bottomRight: Radius.circular(Dimension.radius8),
                ),
                color: theme.colors.white,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Dimension.padding12,
                horizontal: Dimension.padding16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? "--",
                          style: AppTextStyle.s14w600.copyWith(color: theme.colors.neutral13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          content ?? "--",
                          style: AppTextStyle.s12w400.copyWith(color: theme.colors.neutral10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Ink(
                      width: Dimension.h24,
                      height: Dimension.h24,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: AppSvgs.icChevronForward,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
