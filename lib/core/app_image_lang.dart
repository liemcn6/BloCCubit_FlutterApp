part of 'core.dart';

class OtherAssetPickerTextDelegate extends AssetPickerTextDelegate {
  final AppLocalizations lang;

  OtherAssetPickerTextDelegate(this.lang);

  @override
  String get languageCode => lang.languageCode;

  @override
  String get confirm => lang.confirm;

  @override
  String get cancel => lang.cancel;

  @override
  String get edit => lang.edit;

  @override
  String get gifIndicator => lang.gifIndicator;

  @override
  String get loadFailed => lang.loadFailed;

  @override
  String get original => lang.original;

  @override
  String get preview => lang.preview;

  @override
  String get select => lang.select;

  @override
  String get emptyList => lang.emptyList;

  @override
  String get unSupportedAssetType => lang.unSupportedAssetType;

  @override
  String get unableToAccessAll => lang.unableToAccessAll;

  @override
  String get viewingLimitedAssetsTip => lang.viewingLimitedAssetsTip;

  @override
  String get changeAccessibleLimitedAssets =>
      lang.changeAccessibleLimitedAssets;

  @override
  String get accessAllTip => lang.accessAllTip;

  @override
  String get goToSystemSettings => lang.goToSystemSettings;

  @override
  String get accessLimitedAssets => lang.accessLimitedAssets;

  @override
  String get accessiblePathName => lang.accessiblePathName;

  @override
  String get sTypeAudioLabel => lang.sTypeAudioLabel;

  @override
  String get sTypeImageLabel => lang.sTypeImageLabel;

  @override
  String get sTypeVideoLabel => lang.sTypeVideoLabel;

  @override
  String get sTypeOtherLabel => lang.sTypeOtherLabel;

  @override
  String get sActionPlayHint => lang.sActionPlayHint;

  @override
  String get sActionPreviewHint => lang.sActionPreviewHint;

  @override
  String get sActionSelectHint => lang.sActionSelectHint;

  @override
  String get sActionSwitchPathLabel => lang.sActionSwitchPathLabel;

  @override
  String get sActionUseCameraHint => lang.sActionUseCameraHint;

  @override
  String get sNameDurationLabel => lang.sNameDurationLabel;

  @override
  String get sUnitAssetCountLabel => lang.sUnitAssetCountLabel;
}