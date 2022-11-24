import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/onboarding_model.dart';
import 'package:pcgo/localization/language_constrants.dart';
import 'package:pcgo/utill/app_constants.dart';

import '../../utill/images.dart';

class OnBoardingRepo{
  final DioClient dioClient;
  OnBoardingRepo({@required this.dioClient});

  Future<ApiResponse> getOnBoardingList(BuildContext context) async {
    try {
      List<OnboardingModel> onBoardingList = [
        OnboardingModel(
          Images.onboarding_image_one,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.onboarding_image_two,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.onboarding_image_three,
          'not used',
          'not used',
        ),
        OnboardingModel(
          Images.onboarding_image_four,
          'not used',
          'not used',
        ),
      ];

      Response response = Response(requestOptions: RequestOptions(path: ''), data: onBoardingList,statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}