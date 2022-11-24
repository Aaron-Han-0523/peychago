class RequestModel {
  String _carNum;
  int _supplierUsers_id;
  int _commission;
  int _price;
  int _loss;
  int _deliveryFee;
  int _collectMethod;
  String _deliveryDate;
  String _collectPlace;
  String _phoneNum;
  String _bankName1;
  String _accountNum1;
  String _accountHolder1;
  int _amount1;
  String _bankName2;
  String _accountNum2;
  String _accountHolder2;
  int _amount2;
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

  RequestModel({
    String carNum,
    int supplierUsers_id,
    int commission,
    int price,
    int loss,
    int deliveryFee,
    int collectMethod,
    String deliveryDate,
    String collectPlace,
    String phoneNum,
    String bankName1,
    String accountNum1,
    String accountHolder1,
    int amount1,
    String bankName2,
    String accountNum2,
    String accountHolder2,
    int amount2,
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
    this._supplierUsers_id = supplierUsers_id;
    this._commission = commission;
    this._price = price;
    this._loss = loss;
    this._deliveryFee = deliveryFee;
    this._collectMethod = collectMethod;
    this._deliveryDate = deliveryDate;
    this._collectPlace = collectPlace;
    this._phoneNum = phoneNum;
    this._bankName1 = bankName1;
    this._accountNum1 = accountNum1;
    this._accountHolder1 = accountHolder1;
    this._amount1 = amount1;
    this._bankName2 = bankName2;
    this._accountNum2 = accountNum2;
    this._accountHolder2 = accountHolder2;
    this._amount2 = amount2;
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
  int get supplierUsers_id => _supplierUsers_id;
  int get commission => _commission;
  int get price => _price;
  int get loss => _loss;
  int get deliveryFee => _deliveryFee;
  int get collectMethod => _collectMethod;
  String get deliveryDate => _deliveryDate;
  String get collectPlace => _collectPlace;
  String get phoneNum => _phoneNum;
  String get bankName1 => _bankName1;
  String get accountNum1 => _accountNum1;
  String get accountHolder1 => _accountHolder1;
  int get amount1 => _amount1;
  String get bankName2 => _bankName2;
  String get accountNum2 => _accountNum2;
  String get accountHolder2 => _accountHolder2;
  int get amount2 => _amount2;
  String get note => _note;
  String get createUser => _createUser;
  String get createDate => _createDate;
  String get updateUser => _updateUser;
  String get updateDate => _updateDate;
  String get deleteUser => _deleteUser;
  String get deleteDate => _deleteDate;
  String get custom1 => _custom1;
  String get custom2 => _custom2;
  String get custom3 => _custom3;

  RequestModel.fromJson(Map<String, dynamic> json) {
    _carNum = json['carNum'];
    _supplierUsers_id = json['supplierUsers_id'];
    _commission = json['commission'];
    _price = json['price'];
    _loss = json['loss'];
    _deliveryFee = json['deliveryFee'];
    _collectMethod = json['collectMethod'];
    _deliveryDate = json['deliveryDate'];
    _collectPlace = json['collectPlace'];
    _phoneNum = json['phoneNum'];
    _bankName1 = json['bankName1'];
    _accountNum1 = json['accountNum1'];
    _accountHolder1 = json['accountHolder1'];
    _amount1 = json['amount1'];
    _bankName2 = json['bankName2'];
    _accountNum2 = json['accountNum2'];
    _accountHolder2 = json['accountHolder2'];
    _amount2 = json['amount2'];
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
    data['supplierUsers_id'] = this._supplierUsers_id;
    data['commission'] = this._commission;
    data['price'] = this._price;
    data['loss'] = this._loss;
    data['deliveryFee'] = this._deliveryFee;
    data['collectMethod'] = this._collectMethod;
    data['deliveryDate'] = this._deliveryDate;
    data['collectPlace'] = this._collectPlace;
    data['phoneNum'] = this._phoneNum;
    data['bankName1'] = this._bankName1;
    data['accountNum1'] = this._accountNum1;
    data['accountHolder1'] = this._accountHolder1;
    data['amount1'] = this._amount1;
    data['bankName2'] = this._bankName2;
    data['accountNum2'] = this._accountNum2;
    data['accountHolder2'] = this._accountHolder2;
    data['amount2'] = this._amount2;
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
}
