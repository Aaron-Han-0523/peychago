import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/clients_model.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientsRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ClientsRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> login(ClientsModel clientsModel) async {
    Map<String, dynamic> _data = {
      'phoneNum': clientsModel.phoneNum,
      'password': clientsModel.password,
    };

    try {
      final response = await dioClient.post(
        AppConstants.LOGIN_CLIENTS_URI,
        data: _data,
      );

      await sharedPreferences.setInt("clients_id", int.parse(response.data));

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError("로그인 실패"
      );
    }
  }

  Future<ApiResponse> addClients(ClientsModel clientsModel) async {
    Map<String, dynamic> _data = {
      'clientName': clientsModel.clientName,
      'phoneNum': clientsModel.phoneNum,
      'password': clientsModel.password,
      'carNum': clientsModel.carNum,
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_CLIENTS_URI,
        data: _data,
      );

      sharedPreferences.setInt("clients_id", response.data['clients_id']);
      sharedPreferences.setString("phoneNum", response.data['phoneNum']);

      // request PK
      sharedPreferences.setString("clientName", response.data['clientName']);
      // request PK
      sharedPreferences.setString("carNum", response.data['carNum']);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateClients(ClientsModel clientsModel) async {
    Map<String, dynamic> _data = {
      'clients_id': sharedPreferences.getInt("clients_id"),
      'address': clientsModel.address,
      'email': clientsModel.email,
    };

    try {
      final response =
          await dioClient.put(AppConstants.UPDATE_CLIENTS_URI, data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateClientsForReviewId(ClientsModel clientsModel) async {
    Map<String, dynamic> _data = {
      'clients_id': sharedPreferences.getInt("clients_id"),
      'custom1': clientsModel.custom1,
    };

    try {
      final response =
      await dioClient.put(AppConstants.UPDATE_CLIENTS_URI, data: _data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
