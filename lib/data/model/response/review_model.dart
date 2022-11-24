class ReviewModel {
  int _review_id;
  String _carNum;
  String _phoneNum;
  String _clientName;
  String _title;
  String _content;
  int _grade;
  String _attachedFilepath1;
  String _attachedFilepath2;
  String _attachedFilepath3;
  String _createUser;
  String _createDate;
  String _updateUser;
  String _updateDate;
  String _deleteUser;
  String _deleteDate;
  String _custom1;
  String _custom2;
  String _custom3;
  int _clients_id;
  int _carInfo_id;
  int _supplierUsers_id;

  ReviewModel({
    int review_id,
    String carNum,
    String phoneNum,
    String clientName,
    String title,
    String content,
    int grade,
    String attachedFilepath1,
    String attachedFilepath2,
    String attachedFilepath3,
    String createUser,
    String createDate,
    String updateUser,
    String updateDate,
    String deleteUser,
    String deleteDate,
    String custom1,
    String custom2,
    String custom3,
    int clients_id,
    int carInfo_id,
    int supplierUsers_id,
  }) {
    this._review_id = review_id;
    this._carNum = carNum;
    this._phoneNum = phoneNum;
    this._clientName = clientName;
    this._title = title;
    this._content = content;
    this._grade = grade;
    this._attachedFilepath1 = attachedFilepath1;
    this._attachedFilepath2 = attachedFilepath2;
    this._attachedFilepath3 = attachedFilepath3;
    this._createUser = createUser;
    this._createDate = createDate;
    this._updateUser = updateUser;
    this._updateDate = updateDate;
    this._deleteUser = deleteUser;
    this._deleteDate = deleteDate;
    this._custom1 = custom1;
    this._custom2 = custom2;
    this._custom3 = custom3;
    this._clients_id = clients_id;
    this._carInfo_id = carInfo_id;
    this._supplierUsers_id = supplierUsers_id;
  }


  int get review_id => _review_id;

  set review_id(int value) {
    _review_id = value;
  }

  ReviewModel.fromJson(Map<String, dynamic> json) {
    _review_id = json['review_id'];
    _carNum = json['carNum'];
    _phoneNum = json['phoneNum'];
    _clientName = json['clientName'];
    _title = json['title'];
    _content = json['content'];
    _grade = json['grade'];
    _attachedFilepath1 = json['attachedFilepath1'];
    _attachedFilepath2 = json['attachedFilepath2'];
    _attachedFilepath3 = json['attachedFilepath3'];
    _createUser = json['createUser'];
    _createDate = json['createDate'];
    _updateUser = json['updateUser'];
    _updateDate = json['updateDate'];
    _deleteUser = json['deleteUser'];
    _deleteDate = json['deleteDate'];
    _custom1 = json['custom1'];
    _custom2 = json['custom2'];
    _custom3 = json['custom3'];
    _clients_id = json['clients_id'];
    _carInfo_id = json['carInfo_id'];
    _supplierUsers_id = json['supplierUsers_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this._review_id;
    data['carNum'] = this._carNum;
    data['phoneNum'] = this._phoneNum;
    data['clientName'] = this._clientName;
    data['title'] = this._title;
    data['content'] = this._content;
    data['grade'] = this._grade;
    data['attachedFilepath1'] = this._attachedFilepath1;
    data['attachedFilepath2'] = this._attachedFilepath2;
    data['attachedFilepath3'] = this._attachedFilepath3;
    data['createUser'] = this._createUser;
    data['createDate'] = this._createDate;
    data['updateUser'] = this._updateUser;
    data['updateDate'] = this._updateDate;
    data['deleteUser'] = this._deleteUser;
    data['deleteDate'] = this._deleteDate;
    data['custom1'] = this._custom1;
    data['custom2'] = this._custom2;
    data['custom3'] = this._custom3;
    data['clients_id'] = this._clients_id;
    data['carInfo_id'] = this._carInfo_id;
    data['supplierUsers_id'] = this._supplierUsers_id;
    return data;
  }

  set carNum(String value) {
    _carNum = value;
  }

  set phoneNum(String value) {
    _phoneNum = value;
  }

  set clientName(String value) {
    _clientName = value;
  }

  set title(String value) {
    _title = value;
  }

  set content(String value) {
    _content = value;
  }

  set grade(int value) {
    _grade = value;
  }

  set attachedFilepath1(String value) {
    _attachedFilepath1 = value;
  }

  set attachedFilepath2(String value) {
    _attachedFilepath2 = value;
  }

  set attachedFilepath3(String value) {
    _attachedFilepath3 = value;
  }

  set createUser(String value) {
    _createUser = value;
  }

  set createDate(String value) {
    _createDate = value;
  }

  set updateUser(String value) {
    _updateUser = value;
  }

  set updateDate(String value) {
    _updateDate = value;
  }

  set deleteUser(String value) {
    _deleteUser = value;
  }

  set deleteDate(String value) {
    _deleteDate = value;
  }

  set custom1(String value) {
    _custom1 = value;
  }

  set custom2(String value) {
    _custom2 = value;
  }

  set custom3(String value) {
    _custom3 = value;
  }

  set clients_id(int value) {
    _clients_id = value;
  }

  set carInfo_id(int value) {
    _carInfo_id = value;
  }

  set supplierUsers_id(int value) {
    _supplierUsers_id = value;
  }

  String get carNum => _carNum;

  String get phoneNum => _phoneNum;

  String get clientName => _clientName;

  String get title => _title;

  String get content => _content;

  int get grade => _grade;

  String get attachedFilepath1 => _attachedFilepath1;

  String get attachedFilepath2 => _attachedFilepath2;

  String get attachedFilepath3 => _attachedFilepath3;

  String get createUser => _createUser;

  String get createDate => _createDate;

  String get updateUser => _updateUser;

  String get updateDate => _updateDate;

  String get deleteUser => _deleteUser;

  String get deleteDate => _deleteDate;

  String get custom1 => _custom1;

  String get custom2 => _custom2;

  String get custom3 => _custom3;

  int get clients_id => _clients_id;

  int get carInfo_id => _carInfo_id;

  int get supplierUsers_id => _supplierUsers_id;
}

class Reviews {
  int _count;
  List<ReviewModel> _reviews;

  Reviews({int count, List<ReviewModel> reviews}) {
    this._count = count;
    this._reviews = reviews;
  }

  int get count => _count;

  List<ReviewModel> get reviews => _reviews;

  Reviews.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _reviews = [];
      json['rows'].forEach((v) {
        _reviews.add(new ReviewModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._reviews != null) {
      data['reviews'] = this._reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
