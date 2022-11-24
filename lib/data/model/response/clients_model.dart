class ClientsModel {
  int _clients_id;
  String _clientName;
  String _phoneNum;
  String _password;
  String _carNum;
  String _address;
  String _email;
  String _createDate;
  String _updateDate;
  String _custom1;
  String _custom2;
  String _custom3;

  set clients_id(int value) {
    _clients_id = value;
  }

  ClientsModel(
      {int clients_id,
      String clientName,
      String phoneNum,
      String password,
      String carNum,
      String address,
      String email,
      String createDate,
      String updateDate,
      String custom1,
      String custom2,
      String custom3}) {
    this._clients_id = clients_id;
    this._clientName = clientName;
    this._phoneNum = phoneNum;
    this._password = password;
    this._carNum = carNum;
    this._address = address;
    this._email = email;
    this._createDate = createDate;
    this._updateDate = updateDate;
    this._custom1 = custom1;
    this._custom2 = custom2;
    this._custom3 = custom3;
  }

  int get clients_id => _clients_id;

  String get clientName => _clientName;

  String get phoneNum => _phoneNum;

  String get password => _password;

  String get carNum => _carNum;

  String get address => _address;

  String get email => _email;

  String get createDate => _createDate;

  String get updateDate => _updateDate;

  String get custom1 => _custom1;

  String get custom2 => _custom2;

  String get custom3 => _custom3;

  ClientsModel.fromJson(Map<String, dynamic> json) {
    _clients_id = json['clients_id'];
    _clientName = json['clientName'];
    _phoneNum = json['phoneNum'];
    _password = json['password'];
    _carNum = json['carNum'];
    _address = json['address'];
    _email = json['email'];
    _createDate = json['createDate'];
    _updateDate = json['updateDate'];
    _custom1 = json['custom1'];
    _custom2 = json['custom2'];
    _custom3 = json['custom3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clients_id'] = this._clients_id;
    data['clientName'] = this._clientName;
    data['phoneNum'] = this._phoneNum;
    data['password'] = this._password;
    data['carNum'] = this._carNum;
    data['address'] = this._address;
    data['email'] = this._email;
    data['createDate'] = this._createDate;
    data['updateDate'] = this._updateDate;
    data['custom1'] = this._custom1;
    data['custom2'] = this._custom2;
    data['custom3'] = this._custom3;
    return data;
  }

  set clientName(String value) {
    _clientName = value;
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

  set updateDate(String value) {
    _updateDate = value;
  }

  set createDate(String value) {
    _createDate = value;
  }

  set email(String value) {
    _email = value;
  }

  set address(String value) {
    _address = value;
  }

  set carNum(String value) {
    _carNum = value;
  }

  set password(String value) {
    _password = value;
  }

  set phoneNum(String value) {
    _phoneNum = value;
  }
}
