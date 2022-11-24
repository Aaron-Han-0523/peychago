import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/car_model.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CarRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addCar(CarModel carModel) async {
    Map<String, dynamic> _data = {
      'yearModel': carModel.yearModel,
      'model': carModel.model,
      'detailModel': carModel.detailModel,
      'displacement': carModel.displacement,
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_CAR_URI,
        data: _data,
      );

      // response.data['car_id']

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateCar(CarModel carModel) async {
    //ref 차량 조회 검색조건 필요
    // Map<String, dynamic> _data = {
    //   'car_id': sharedPreferences.getInt("car_id"),
    //   'address': carModel.address,
    //   'email': carModel.email,
    // };

    try {
      final response =
          await dioClient.get(AppConstants.BASE_CAR_URI + "?");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
