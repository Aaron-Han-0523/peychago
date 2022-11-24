import 'package:flutter/material.dart';
import 'package:pcgo/data/model/response/review_model.dart';
import 'package:pcgo/data/repository/review_repo.dart';

import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';

class ReviewProvider extends ChangeNotifier {
  final ReviewRepo reviewRepo;

  ReviewProvider({
    @required this.reviewRepo,
  });

  bool _filterIsLoading = false;
  bool _filterFirstLoading = true;
  bool _firstLoading = true;

  int _latestPageSize;

  List<ReviewModel> _latestReviewList = [];
  List<int> _offsetList = [];
  int _lOffset = 0;
  int limit = 6;

  List<ReviewModel> get latestReviewList => _latestReviewList;

  int get lOffset => _lOffset;

  bool get filterIsLoading => _filterIsLoading;
  bool get filterFirstLoading => _filterFirstLoading;
  bool get firstLoading => _firstLoading;

  int get latestPageSize => _latestPageSize;

  //latest product
  Future<void> getLatestReviewList(int offset, BuildContext context,
      {bool reload = false}) async {
    if (reload) {
      _offsetList = [];
      _latestReviewList = [];
    }

    _lOffset = offset;

    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);

      // limit = pageSize
      // skip = offset
      ApiResponse apiResponse = await reviewRepo.getReviewList(limit, offset * limit);
      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {
        _latestReviewList.addAll(Reviews.fromJson(apiResponse.response.data).reviews);
        _latestPageSize = Reviews.fromJson(apiResponse.response.data).count;
        _filterFirstLoading = false;
        _filterIsLoading = false;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    } else {
      if (_filterIsLoading) {
        _filterIsLoading = false;
        notifyListeners();
      }
    }
  }

  Future<ApiResponse> addReview(ReviewModel reviewModel) {
    notifyListeners();
    return reviewRepo.addReview(reviewModel);
  }

  void updateReview(ReviewModel reviewModel) {
    reviewRepo.updateReview(reviewModel);
    notifyListeners();
  }

  void deleteReview(ReviewModel reviewModel) {
    reviewRepo.deleteReview(reviewModel);
    notifyListeners();
  }
}
