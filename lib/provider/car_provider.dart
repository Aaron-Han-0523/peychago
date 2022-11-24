import 'package:flutter/material.dart';
import 'package:pcgo/data/model/response/car_model.dart';
import 'package:pcgo/data/repository/car_repo.dart';

import '../data/model/response/base/api_response.dart';

class CarProvider extends ChangeNotifier {
  final CarRepo carRepo;

  CarProvider(
      {@required this.carRepo,});

  Future<ApiResponse> addCar(CarModel carModel) async {
    notifyListeners();
    return carRepo.addCar(carModel);
  }

  void updateClients(CarModel carModel) {
    carRepo.updateCar(carModel);
    notifyListeners();
  }
}
