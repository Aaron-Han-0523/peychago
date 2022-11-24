import 'package:flutter/material.dart';
import 'package:pcgo/data/model/response/clients_model.dart';
import 'package:pcgo/data/repository/clients_repo.dart';

import '../data/model/response/base/api_response.dart';
import '../data/model/response/base/error_response.dart';
import '../data/model/response/process_model.dart';
import '../data/model/response/request_model.dart';
import '../data/repository/process_repo.dart';
import '../data/repository/request_repo.dart';

class ClientsProvider extends ChangeNotifier {
  final ClientsRepo clientsRepo;
  final ProcessRepo processRepo;
  final RequestRepo requestRepo;

  ClientsProvider(
      {@required this.clientsRepo,
      @required this.processRepo,
      @required this.requestRepo});

  Future login(ClientsModel clientsModel, Function callback) async {
    try{
      ApiResponse apiResponse = await clientsRepo.login(clientsModel);

      if (apiResponse.response != null &&
          apiResponse.response.statusCode == 200) {

        await processRepo.getProcess();

        callback(true, '');
        notifyListeners();
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          print(apiResponse.error.toString());
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          print(errorResponse.errors[0].message);
          errorMessage = errorResponse.errors[0].message;
        }
        callback(false, errorMessage);
        notifyListeners();
      }
    }catch(e){
      callback(false, e.toString());
    }
    notifyListeners();

  }

  Future<ApiResponse> addClients(ClientsModel clientsModel) async {
    notifyListeners();
    return clientsRepo.addClients(clientsModel);
  }

  void updateClients(ClientsModel clientsModel) {
    clientsRepo.updateClients(clientsModel);
    notifyListeners();
  }

  void updateClientsForReviewId(ClientsModel clientsModel) {
    clientsRepo.updateClientsForReviewId(clientsModel);
    notifyListeners();
  }

  //ref not used
  void estimate(ClientsModel clientsModel, ProcessModel processModel,
      RequestModel requestModel) {
    clientsRepo.updateClients(clientsModel);
    processRepo.updateProcess(processModel);
    requestRepo.addRequest(requestModel);
    notifyListeners();
  }
}
