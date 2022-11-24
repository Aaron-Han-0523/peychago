class ProcessModel {
  String _carNum;
  int _processType;
  int _state;
  int _clients_id;
  int _carInfo_id;
  String _ownerName;
  String _model;
  String _detailModel;
  int _displacement;
  String _yearModel;
  String _registerDate;
  int _carCondition;
  int _aluminumWheel;
  int _attachment;
  int _mortgage;
  String _carImagePath0;
  String _carImagePath1;
  String _carImagePath2;
  String _carImagePath3;
  String _carImagePath4;
  int _estimation;
  int _exportable;
  int _quotation;
  String _finalProcessPath;
  String _deregistrationPath;
  String _date0;
  String _date1;
  String _date2;
  String _date3;
  String _date4;
  String _date5;
  String _date6;
  String _date7;
  String _note;
  String _createUser;
  String _createDate;
  String _updateUser;
  String _updateDate;
  String _deleteUser;
  String _deleteDate;
  String _custom1;
  String _custom2;
  String _custom3;

  ProcessModel({
    String carNum,
    int processType,
    int state,
    int clients_id,
    int carInfo_id,
    String ownerName,
    String model,
    String detailModel,
    int displacement,
    String yearModel,
    String registerDate,
    int carCondition,
    int aluminumWheel,
    int attachment,
    int mortgage,
    String carImagePath0,
    String carImagePath1,
    String carImagePath2,
    String carImagePath3,
    String carImagePath4,
    int estimation,
    int exportable,
    int quotation,
    String finalProcessPath,
    String deregistrationPath,
    String date0,
    String date1,
    String date2,
    String date3,
    String date4,
    String date5,
    String date6,
    String date7,
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
    this._carNum = carNum;
    this._processType = processType;
    this._state = state;
    this._clients_id = clients_id;
    this._carInfo_id = carInfo_id;
    this._ownerName = ownerName;
    this._model = model;
    this._detailModel = detailModel;
    this._displacement = displacement;
    this._yearModel = yearModel;
    this._registerDate = registerDate;
    this._carCondition = carCondition;
    this._aluminumWheel = aluminumWheel;
    this._attachment = attachment;
    this._mortgage = mortgage;
    this._carImagePath0 = carImagePath0;
    this._carImagePath1 = carImagePath1;
    this._carImagePath2 = carImagePath2;
    this._carImagePath3 = carImagePath3;
    this._carImagePath4 = carImagePath4;
    this._estimation = estimation;
    this._exportable = exportable;
    this._quotation = quotation;
    this._finalProcessPath = finalProcessPath;
    this._deregistrationPath = deregistrationPath;
    this._date0 = date0;
    this._date1 = date1;
    this._date2 = date2;
    this._date3 = date3;
    this._date4 = date4;
    this._date5 = date5;
    this._date6 = date6;
    this._date7 = date7;
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

  String get carNum => _carNum;

  int get processType => _processType;

  int get state => _state;

  int get clients_id => _clients_id;

  int get carInfo_id => _carInfo_id;

  String get ownerName => _ownerName;

  String get model => _model;

  String get detailModel => _detailModel;

  int get displacement => _displacement;

  String get yearModel => _yearModel;

  String get registerDate => _registerDate;

  int get carCondition => _carCondition;

  int get aluminumWheel => _aluminumWheel;

  int get attachment => _attachment;

  int get mortgage => _mortgage;

  String get carImagePath0 => _carImagePath0;

  String get carImagePath1 => _carImagePath1;

  String get carImagePath2 => _carImagePath2;

  String get carImagePath3 => _carImagePath3;

  String get carImagePath4 => _carImagePath4;

  int get estimation => _estimation;

  int get exportable => _exportable;

  int get quotation => _quotation;

  String get finalProcessPath => _finalProcessPath;

  String get deregistrationPath => _deregistrationPath;

  String get date0 => _date0;

  String get date1 => _date1;

  String get date2 => _date2;

  String get date3 => _date3;

  String get date4 => _date4;

  String get date5 => _date5;

  String get date6 => _date6;

  String get date7 => _date7;

  String get note => _note;

  String get createUser => _createUser;

  String get createDate => _createDate;

  String get updateUser => _updateUser;

  String get updateDate => _updateDate;

  String get deleteUser => _deleteUser;

  String get deleteDate => _deleteDate;

  String get custom1 => _custom1;

  String get custom2 => _custom2;

  set carNum(String value) {
    _carNum = value;
  }

  String get custom3 => _custom3;

  ProcessModel.fromJson(Map<String, dynamic> json) {
    _carNum = json['carNum'];
    _processType = json['processType'];
    _state = json['state'];
    _clients_id = json['clients_id'];
    _carInfo_id = json['carInfo_id'];
    _ownerName = json['ownerName'];
    _model = json['model'];
    _detailModel = json['detailModel'];
    _displacement = json['displacement'];
    _yearModel = json['yearModel'];
    _registerDate = json['registerDate'];
    _carCondition = json['carCondition'];
    _aluminumWheel = json['aluminumWheel'];
    _attachment = json['attachment'];
    _mortgage = json['mortgage'];
    _carImagePath0 = json['carImagePath0'];
    _carImagePath1 = json['carImagePath1'];
    _carImagePath2 = json['carImagePath2'];
    _carImagePath3 = json['carImagePath3'];
    _carImagePath4 = json['carImagePath4'];
    _estimation = json['estimation'];
    _exportable = json['exportable'];
    _quotation = json['quotation'];
    _finalProcessPath = json['finalProcessPath'];
    _deregistrationPath = json['deregistrationPath'];
    _date0 = json['date0'];
    _date1 = json['date1'];
    _date2 = json['date2'];
    _date3 = json['date3'];
    _date4 = json['date4'];
    _date5 = json['date5'];
    _date6 = json['date6'];
    _date7 = json['date7'];
    _note = json['note'];
    _createUser = json['createUser'];
    _createDate = json['createDate'];
    _updateUser = json['updateUser'];
    _updateDate = json['updateDate'];
    _deleteUser = json['deleteUser'];
    _deleteDate = json['deleteDate'];
    _custom1 = json['custom1'];
    _custom2 = json['custom2'];
    _custom3 = json['custom3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carNum'] = this._carNum;
    data['processType'] = this._processType;
    data['state'] = this._state;
    data['clients_id'] = this._clients_id;
    data['carInfo_id'] = this._carInfo_id;
    data['ownerName'] = this._ownerName;
    data['model'] = this._model;
    data['detailModel'] = this._detailModel;
    data['displacement'] = this._displacement;
    data['yearModel'] = this._yearModel;
    data['registerDate'] = this._registerDate;
    data['carCondition'] = this._carCondition;
    data['aluminumWheel'] = this._aluminumWheel;
    data['attachment'] = this._attachment;
    data['mortgage'] = this._mortgage;
    data['carImagePath0'] = this._carImagePath0;
    data['carImagePath1'] = this._carImagePath1;
    data['carImagePath2'] = this._carImagePath2;
    data['carImagePath3'] = this._carImagePath3;
    data['carImagePath4'] = this._carImagePath4;
    data['estimation'] = this._estimation;
    data['exportable'] = this._exportable;
    data['quotation'] = this._quotation;
    data['finalProcessPath'] = this._finalProcessPath;
    data['deregistrationPath'] = this._deregistrationPath;
    data['date0'] = this._date0;
    data['date1'] = this._date1;
    data['date2'] = this._date2;
    data['date3'] = this._date3;
    data['date4'] = this._date4;
    data['date5'] = this._date5;
    data['date6'] = this._date6;
    data['date7'] = this._date7;
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

  set processType(int value) {
    _processType = value;
  }

  set custom3(String value) {
    _custom3 = value;
  }

  set custom2(String value) {
    _custom2 = value;
  }

  set custom1(String value) {
    _custom1 = value;
  }

  set deleteDate(String value) {
    _deleteDate = value;
  }

  set deleteUser(String value) {
    _deleteUser = value;
  }

  set updateDate(String value) {
    _updateDate = value;
  }

  set updateUser(String value) {
    _updateUser = value;
  }

  set createDate(String value) {
    _createDate = value;
  }

  set createUser(String value) {
    _createUser = value;
  }

  set note(String value) {
    _note = value;
  }

  set date7(String value) {
    _date7 = value;
  }

  set date6(String value) {
    _date6 = value;
  }

  set date5(String value) {
    _date5 = value;
  }

  set date4(String value) {
    _date4 = value;
  }

  set date3(String value) {
    _date3 = value;
  }

  set date2(String value) {
    _date2 = value;
  }

  set date1(String value) {
    _date1 = value;
  }

  set date0(String value) {
    _date0 = value;
  }

  set deregistrationPath(String value) {
    _deregistrationPath = value;
  }

  set finalProcessPath(String value) {
    _finalProcessPath = value;
  }

  set quotation(int value) {
    _quotation = value;
  }

  set exportable(int value) {
    _exportable = value;
  }

  set estimation(int value) {
    _estimation = value;
  }

  set carImagePath4(String value) {
    _carImagePath4 = value;
  }

  set carImagePath3(String value) {
    _carImagePath3 = value;
  }

  set carImagePath2(String value) {
    _carImagePath2 = value;
  }

  set carImagePath1(String value) {
    _carImagePath1 = value;
  }

  set carImagePath0(String value) {
    _carImagePath0 = value;
  }

  set mortgage(int value) {
    _mortgage = value;
  }

  set attachment(int value) {
    _attachment = value;
  }

  set aluminumWheel(int value) {
    _aluminumWheel = value;
  }

  set carCondition(int value) {
    _carCondition = value;
  }

  set registerDate(String value) {
    _registerDate = value;
  }

  set yearModel(String value) {
    _yearModel = value;
  }

  set displacement(int value) {
    _displacement = value;
  }

  set detailModel(String value) {
    _detailModel = value;
  }

  set model(String value) {
    _model = value;
  }

  set ownerName(String value) {
    _ownerName = value;
  }

  set carInfo_id(int value) {
    _carInfo_id = value;
  }

  set clients_id(int value) {
    _clients_id = value;
  }

  set state(int value) {
    _state = value;
  }
}
