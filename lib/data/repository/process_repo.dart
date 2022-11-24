import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/process_model.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ProcessRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addProcess(ProcessModel processModel) async {
    Map<String, dynamic> _data = {
      'clients_id': sharedPreferences.getInt("clients_id"),
      'clientName': sharedPreferences.getString("clientName"),
      'carNum': sharedPreferences.getString("carNum"),
      'state': 0,
      'processType': 0,
      'ownerName': processModel.ownerName,
      'model': processModel.model,
      'detailModel': processModel.detailModel,
      'displacement': processModel.displacement,
      'yearModel': processModel.yearModel,
      'registerDate': processModel.registerDate,

      // system 등록 차량 정보
      // 'carInfo_id': null,
      'carInfo_id': processModel.carInfo_id??null,
    };

    try {
      final response = await dioClient.post(
        AppConstants.ADD_PROCESS_URI,
        data: _data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateProcess(ProcessModel processModel) async {
    Map<String, dynamic> _data = {
      'clients_id': sharedPreferences.getInt("clients_id"),
      'state': processModel.state,
      'date0': processModel.date0,
      'date1': processModel.date1,
      'date2': processModel.date2,
      'date3': processModel.date3,
      'date4': processModel.date4,
      'date5': processModel.date5,
      'date6': processModel.date6,
      'date7': processModel.date7,
      'carCondition': processModel.carCondition,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_PROCESS_URI, data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProcess() async {
    try {
      final response = await dioClient.get(
        AppConstants.BASE_PROCESS_URI +
            "?clients_id=${sharedPreferences.getInt("clients_id")}",
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getProcessByCarNum(ProcessModel processModel) async {
    try {
      final response = await dioClient.get(
        AppConstants.BASE_PROCESS_URI +
            "/${processModel.carNum}",
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
