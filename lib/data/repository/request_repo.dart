import 'package:flutter/material.dart';
import 'package:pcgo/data/datasource/remote/dio/dio_client.dart';
import 'package:pcgo/data/datasource/remote/exception/api_error_handler.dart';
import 'package:pcgo/data/model/response/base/api_response.dart';
import 'package:pcgo/data/model/response/request_model.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  RequestRepo({@required this.dioClient, @required this.sharedPreferences});

  Future<ApiResponse> addRequest(RequestModel requestModel) async {
    Map<String, dynamic> _data = {
      'deliveryDate': requestModel.deliveryDate,
      'collectPlace': requestModel.collectPlace,
      'phoneNum': requestModel.phoneNum,
      'bankName1': requestModel.bankName1,
      'accountNum1': requestModel.accountNum1,
      'accountHolder1': requestModel.accountHolder1,
      'bankName2': requestModel.bankName2,
      'accountNum2': requestModel.accountNum2,
      'accountHolder2': requestModel.accountHolder2,
      'clients_id': sharedPreferences.getInt("clients_id"),
    };

    try {
      var response = await dioClient.post(
        AppConstants.ADD_REQUEST_URI,
        data: _data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
