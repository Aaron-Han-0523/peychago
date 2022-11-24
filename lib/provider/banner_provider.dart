import 'package:flutter/material.dart';
import 'package:pcgo/data/model/response/banner_model.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/repository/banner_repo.dart';
import 'package:pcgo/helper/api_checker.dart';

class BannerProvider extends ChangeNotifier {
  final BannerRepo bannerRepo;

  BannerProvider({@required this.bannerRepo});

  List<BannerModel> _mainBannerList;
  BannerModel _mainBannerJson;
  int _currentIndex = 0;
  int _totalIndex = 0;

  List<BannerModel> get mainBannerList => _mainBannerList;
  BannerModel get mainBannerJson => _mainBannerJson;
  int get currentIndex => _currentIndex;
  int get totalIndex => _totalIndex;

  Future<void> getBannerList(bool reload, BuildContext context) async {
    if (_mainBannerJson == null || reload) {
      ApiResponse apiResponse = await bannerRepo.getBannerJson();
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        apiResponse.response.data.forEach((bannerModel) => _mainBannerJson = BannerModel.fromJson(bannerModel));

        _currentIndex = 0;
        notifyListeners();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  Future<void> getBannerJson(bool reload, BuildContext context) async {
    if (_mainBannerJson == null || reload) {
      ApiResponse apiResponse = await bannerRepo.getBannerJson();
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _mainBannerJson = BannerModel.fromJson(apiResponse.response.data);

        _totalIndex = 0;
        if(_mainBannerJson.about2ImagePath != "") _totalIndex++;
        if(_mainBannerJson.noticeImagePath != "") _totalIndex++;

        notifyListeners();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
