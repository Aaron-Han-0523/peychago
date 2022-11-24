import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/review_model.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ReviewRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addReview(ReviewModel reviewModel) async {

    List<MultipartFile> uploadFiles = [];

    if(reviewModel.attachedFilepath1 != null) uploadFiles.add(await MultipartFile.fromFile(reviewModel.attachedFilepath1));
    if(reviewModel.attachedFilepath2 != null) uploadFiles.add(await MultipartFile.fromFile(reviewModel.attachedFilepath2));
    if(reviewModel.attachedFilepath3 != null) uploadFiles.add(await MultipartFile.fromFile(reviewModel.attachedFilepath3));

    var formData = FormData.fromMap({
      'files' : uploadFiles,
      'title': reviewModel.title,
      'content': reviewModel.content,
      'grade': reviewModel.grade,
      'clients_id': sharedPreferences.getInt("clients_id"),
    });

    try {
      // dioClient.dio.options.headers = {'Content-Type': 'multipart/form-data; charset=UTF-8'};

      var response = await dioClient.post(
        AppConstants.ADD_REVIEW_URI,
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateReview(ReviewModel reviewModel) async {
    Map<String, dynamic> _data = {
      'clients_id': sharedPreferences.getInt("clients_id"),
      'title': reviewModel.title,
      'content': reviewModel.content,
      'grade': reviewModel.grade,
      'review_id': reviewModel.review_id,
      'custom1': reviewModel.custom1,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_REVIEW_URI + "/${reviewModel.review_id}", data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteReview(ReviewModel reviewModel) async {
    try {
      final response = await dioClient.delete(
        AppConstants.BASE_REVIEW_URI +
            "/${reviewModel.review_id}?clients_id=${sharedPreferences.getInt("clients_id")}",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // limit = pageSize, skip = offset
  Future<ApiResponse> getReviewList(int limit, int skip) async {
    try {
      final response = await dioClient.get(
        AppConstants.BASE_REVIEW_URI + "?limit=$limit&skip=$skip",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getReview(int review_id) async {
    try {
      final response = await dioClient.get(
        AppConstants.BASE_REVIEW_URI + "/$review_id",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
