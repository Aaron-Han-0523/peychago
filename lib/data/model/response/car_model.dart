// carinfo == car
class CarModel {
  int    _carInfo_id   ;
  String _maker        ;
  String _model        ;
  String _detailModel  ;
  int    _displacement ;
  String _yearModel    ;
  int    _price        ;
  String _note         ;
  String _createUser   ;
  String _createDate   ;
  String _updateUser   ;
  String _updateDate   ;
  String _deleteUser   ;
  String _deleteDate   ;
  String _custom1      ;
  String _custom2      ;
  String _custom3      ;

  CarModel({
    int carInfo_id,
    String maker,
    String model,
    String detailModel,
    int displacement,
    String yearModel,
    int price,
    String note,
    String createUser,
    String createDate,
    String updateUser,
    String updateDate,
    String deleteUser,
    String deleteDate,
    String custom1,
    String custom2,
    String custom3,
  }) {
    this._carInfo_id = carInfo_id;
    this._maker = maker;
    this._model = model;
    this._detailModel = detailModel;
    this._displacement = displacement;
    this._yearModel = yearModel;
    this._price = price;
    this._note = note;
    this._createUser = createUser;
    this._createDate = createDate;
    this._updateUser = updateUser;
    this._updateDate = updateDate;
    this._deleteUser = deleteUser;
    this._deleteDate = deleteDate;
    this._custom1 = custom1;
    this._custom2 = custom2;
    this._custom3 = custom3;
  }

  int get carInfo_id => _carInfo_id;

  set carInfo_id(int value) {
    _carInfo_id = value;
  }

  CarModel.fromJson(Map<String, dynamic> json) {
    _carInfo_id=json['carInfo_id'];
    _maker=json['maker'];
    _model=json['model'];
    _detailModel=json['detailModel'];
    _displacement=json['displacement'];
    _yearModel=json['yearModel'];
    _price=json['price'];
    _note=json['note'];
    _createUser=json['createUser'];
    _createDate=json['createDate'];
    _updateUser=json['updateUser'];
    _updateDate=json['updateDate'];
    _deleteUser=json['deleteUser'];
    _deleteDate=json['deleteDate'];
    _custom1=json['custom1'];
    _custom2=json['custom2'];
    _custom3=json['custom3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carInfo_id'] = this._carInfo_id;
    data['maker'] = this._maker;
    data['model'] = this._model;
    data['detailModel'] = this._detailModel;
    data['displacement'] = this._displacement;
    data['yearModel'] = this._yearModel;
    data['price'] = this._price;
    data['note'] = this._note;
    data['createUser'] = this._createUser;
    data['createDate'] = this._createDate;
    data['updateUser'] = this._updateUser;
    data['updateDate'] = this._updateDate;
    data['deleteUser'] = this._deleteUser;
    data['deleteDate'] = this._deleteDate;
    data['custom1'] = this._custom1;
    data['custom2'] = this._custom2;
    data['custom3'] = this._custom3;
    return data;
  }

  String get maker => _maker;

  set maker(String value) {
    _maker = value;
  }

  String get model => _model;

  set model(String value) {
    _model = value;
  }

  String get detailModel => _detailModel;

  set detailModel(String value) {
    _detailModel = value;
  }

  int get displacement => _displacement;

  set displacement(int value) {
    _displacement = value;
  }

  String get yearModel => _yearModel;

  set yearModel(String value) {
    _yearModel = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }

  String get createUser => _createUser;

  set createUser(String value) {
    _createUser = value;
  }

  String get createDate => _createDate;

  set createDate(String value) {
    _createDate = value;
  }

  String get updateUser => _updateUser;

  set updateUser(String value) {
    _updateUser = value;
  }

  String get updateDate => _updateDate;

  set updateDate(String value) {
    _updateDate = value;
  }

  String get deleteUser => _deleteUser;

  set deleteUser(String value) {
    _deleteUser = value;
  }

  String get deleteDate => _deleteDate;

  set deleteDate(String value) {
    _deleteDate = value;
  }

  String get custom1 => _custom1;

  set custom1(String value) {
    _custom1 = value;
  }

  String get custom2 => _custom2;

  set custom2(String value) {
    _custom2 = value;
  }

  String get custom3 => _custom3;

  set custom3(String value) {
    _custom3 = value;
  }
}
