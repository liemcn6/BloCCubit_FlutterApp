import 'package:home_care/domain/entities/authentication/authorities.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';

class AppStorage {
  Authorities _authorities = const Authorities();
  String _currentLanguage = 'vi';
  String? _imgEncToken;
  List<RowItem> _buildingList = [];

  Authorities get authorities => _authorities;
  String get currentLanguage => _currentLanguage;
  String? get imgEncToken => _imgEncToken;
  List<RowItem> get buildingList => _buildingList;

  static final AppStorage _instance = AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }
  AppStorage._internal();

  void setAuthorities(Authorities authorities) {
    _authorities = authorities;
  }

  void setCurrentLanguage(String currentLanguage) {
    _currentLanguage = currentLanguage;
  }

  void setImgEncToken(String? imgEncToken) {
    _imgEncToken = imgEncToken;
  }

  void setBuildingList(List<RowItem> buildingList) {
    _buildingList = buildingList;
  }

  void clear() {
    _authorities = const Authorities();
    _currentLanguage = 'vi';
    _imgEncToken = null;
    _buildingList = [];
  }
}
