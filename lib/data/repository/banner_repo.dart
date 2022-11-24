import 'package:flutter/material.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/utill/app_constants.dart';

class BannerRepo {
  final DioClient dioClient;
  BannerRepo({@required this.dioClient});

  Future<ApiResponse> getBannerList() async {
    try {
      print("Dddd");
      print("http://52.78.243.91/api/imageSetting");
      final response = await dioClient.get(AppConstants.MAIN_BANNER_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getBannerJson() async {
    try {
      print("Dddd");
      print("http://52.78.243.91/api/imageSetting");
      final response = await dioClient.get(AppConstants.MAIN_BANNER_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}