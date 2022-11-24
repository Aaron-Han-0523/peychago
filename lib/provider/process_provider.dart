import 'package:flutter/material.dart';
import 'package:pcgo/data/model/response/process_model.dart';
import 'package:pcgo/data/repository/process_repo.dart';

import '../data/model/response/base/api_response.dart';

class ProcessProvider extends ChangeNotifier {
  final ProcessRepo processRepo;

  ProcessProvider({@required this.processRepo});

  ProcessModel _process;

  ProcessModel get process => _process;

  void addProcess(ProcessModel processModel) {
    processRepo.addProcess(processModel);
    notifyListeners();
  }

  void updateProcess(ProcessModel processModel) {
    processRepo.updateProcess(processModel);
    notifyListeners();
  }

  Future<ProcessModel> getProcess() async {
    ApiResponse apiResponse = await processRepo.getProcess();
    // apiResponse.response.data.forEach((process) => _process = ProcessModel.fromJson(process));
    _process = ProcessModel.fromJson(apiResponse.response.data);
    notifyListeners();
    return _process;
  }

  Future<void> getProcessByCarNum(ProcessModel processModel) async {
    ApiResponse apiResponse = await processRepo.getProcessByCarNum(processModel);
    try {
      apiResponse.response.data.forEach((process) => _process = ProcessModel.fromJson(process));
    } catch (e) {
      _process = null;
    }
    notifyListeners();
  }
}
