import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/domain/entities/authentication/permissions.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/usecases/news/community_newsletter_usecase.dart';
import 'package:home_care/presentation/modules/home/models/enum/home_type.dart';
import 'package:home_care/presentation/modules/home/models/home_model.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';
import 'package:home_care/presentation/routes.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Function notifyParent;
  HomeCubit(this.notifyParent) : super(HomeInitial());

  //usecase
  final _communityNewsletterUsecase = getIt.get<CommunityNewsletterUseCase>();

  //perms
  Permissions? perms;

  Future<void> getInit({required BuildContext context}) async {
    if (isClosed) return;

    getFunctionsCustomerAccount(context: context);
    getUserProfile();
  }

  Future<void> getInitBottomSheet({required BuildContext context}) async {
    if (isClosed) return;

    getFunctionsCustomerAccount(context: context);
  }

  Future<void> handlerRefresh({required BuildContext context}) async {
    await getInit(context: context);
  }

  Future<void> getUserProfile() async {
    final userProfile = await AppSecureStorage.getProfile();
    final perms = AppStorage().authorities.permissions;

    if (userProfile != null) {
      emit(state.copyWith(userProfile: userProfile));
    }

    if (perms == null) {
      emit(state.copyWith(
        isAccessLimited: true,
      ));
    } else if (perms.isNewsView) {
      await Future.wait([
        searchNews(),
        searchNewsMostViewed(),
      ]);
      emit(state.copyWith(isAccessLimited: false, isNewsViewed: perms.isNewsView));
    }
  }

  Future<bool> getPerms() async {
    bool isDone = false;
    perms = AppStorage().authorities.permissions;
    if (perms != null) {
      isDone = true;
    }
    return isDone;
  }

  void getFunctionsCustomerAccount({required BuildContext context}) async {
    List<HomeModel> listScreen = [];
    final t = Utils.languageOf(context);
    final result = await getPerms();
    if (result) {
      //request reflect
      if (perms?.isTicketView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icRequest.assetName, width: 48),
            title: t.request_reflect,
            onPress: () {
              // notifyParent();
              AppNavigator.pushRoot(Routes.bottomNavigationBar, 2);
            },
            type: HomeType.contact,
          ),
        );
      }

      //news
      if (perms?.isNewsView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icNews.assetName, width: 48),
            title: t.news,
            onPress: () {
              AppNavigator.push(Routes.newsMain);
            },
            type: HomeType.contact,
          ),
        );
      }

      // Bill
      if (perms?.isInvoiceView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icBill.assetName, width: 48),
            title: t.bill,
            onPress: () {
              AppNavigator.push(Routes.bill);
            },
            type: HomeType.contact,
          ),
        );
      }

      //monthly verhicle
      if (perms?.isVehicleView == true || perms?.isParkingRegistrationView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icVerhicle.assetName, width: 48),
            title: t.monthly_verhicle,
            onPress: () {
              AppNavigator.push(Routes.vehicleList);
            },
            type: HomeType.contact,
          ),
        );
      }

      //support
      listScreen.add(
        HomeModel(
          screenIc: Image.asset(AppImages.icSupport.assetName, width: 48),
          title: t.emergency_support,
          onPress: () {
            // notifyParent();
            AppNavigator.pushRoot(Routes.bottomNavigationBar, 2);
          },
          type: HomeType.contract,
        ),
      );

      // contract
      if (perms?.isLeasingContractView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icContract.assetName, width: 48),
            title: t.contract,
            onPress: () {
              AppNavigator.push(Routes.contract);
            },
            type: HomeType.contact,
          ),
        );
      }

      //utility services
      if (perms?.isBookingServiceView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icService.assetName, width: 48),
            title: t.utility_service,
            onPress: () {
              // ToastUtil.show(t.under_development_feature);
              AppNavigator.push(Routes.service);
            },
            type: HomeType.contract,
          ),
        );
      }

      //market
      // listScreen.add(
      //   HomeModel(
      //     screenIc: Image.asset(AppImages.icMarket.assetName, width: 48),
      //     title: t.market,
      //     onPress: () {
      //       ToastUtil.show(t.under_development_feature);
      //     },
      //     // valueType: HomeValueType,
      //     type: HomeType.contact,
      //   ),
      // );

      //survey
      if (perms?.isSurveyView == true) {
        listScreen.add(
          HomeModel(
            screenIc: Image.asset(AppImages.icSurvey.assetName, width: 48),
            title: t.survey,
            onPress: () {
              // ToastUtil.show(t.under_development_feature);
              AppNavigator.pushRoot(Routes.bottomNavigationBar, 1);
            },
            // valueType: HomeValueType,
            type: HomeType.contact,
          ),
        );
      }

      emit(state.copyWith(listScreen: listScreen));
    }
  }

  Future<void> searchNews() async {
    if (isClosed) return;

    List<String> buildingIdList = await _communityNewsletterUsecase.getBuilding();
    List<NewsModel> communityNewsletterModelList =
        await _communityNewsletterUsecase.searchNews(buildingIdList);

    emit(state.copyWith(
        communityNewsletterModelList: communityNewsletterModelList, isMostViewLoading: false));
  }

  Future<void> searchNewsMostViewed() async {
    if (isClosed) return;
    List<NewsModel> communityMostViewedNewsletterList =
        await _communityNewsletterUsecase.searchNewsMostViewed();
    emit(state.copyWith(
      mostViewedNewsletterModelList: communityMostViewedNewsletterList,
      isNewsLoading: false,
    ));
  }
}
