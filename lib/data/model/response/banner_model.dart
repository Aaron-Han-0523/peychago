class BannerModel {
  int imagesetting_id;
  String noticeImagePath;
  String about1Title;
  String about1URL;
  String about2Title;
  String about2ImagePath;
  String privacyImagePath;
  String termOfServicePath;
  String exportNoticePath;
  String exportPicturePath;
  String custom1;
  String custom2;
  String custom3;

  BannerModel(
      {int imagesetting_id,
      String noticeImagePath,
      String about1Title,
      String about1URL,
      String about2Title,
      String about2ImagePath,
      String privacyImagePath,
      String termOfServicePath,
      String exportNoticePath,
      String exportPicturePath,
      String custom1,
      String custom2,
      String custom3,
      }) {
    this.imagesetting_id = imagesetting_id;
    this.noticeImagePath = noticeImagePath;
    this.about1Title = about1Title;
    this.about1URL = about1URL;
    this.about2Title = about2Title;
    this.about2ImagePath = about2ImagePath;
    this.privacyImagePath = privacyImagePath;
    this.termOfServicePath = termOfServicePath;
    this.exportNoticePath = exportNoticePath;
    this.exportPicturePath = exportPicturePath;
    this.custom1 = custom1;
    this.custom2 = custom2;
    this.custom3 = custom3;
  }

  BannerModel.fromJson(Map<String, dynamic> json) {
    imagesetting_id = json['imagesetting_id'];
    noticeImagePath = json['noticeImagePath'];
    about1Title = json['about1Title'];
    about1URL = json['about1URL'];
    about2Title = json['about2Title'];
    about2ImagePath = json['about2ImagePath'];
    privacyImagePath = json['privacyImagePath'];
    termOfServicePath = json['termOfServicePath'];
    exportNoticePath = json['exportNoticePath'];
    exportPicturePath = json['exportPicturePath'];
    custom1 = json['custom1'];
    custom2 = json['custom2'];
    custom3 = json['custom3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagesetting_id'] = this.imagesetting_id;
    data['noticeImagePath'] = this.noticeImagePath;
    data['about1Title'] = this.about1Title;
    data['about1URL'] = this.about1URL;
    data['about2Title'] = this.about2Title;
    data['about2ImagePath'] = this.about2ImagePath;
    data['privacyImagePath'] = this.privacyImagePath;
    data['termOfServicePath'] = this.termOfServicePath;
    data['exportNoticePath'] = this.exportNoticePath;
    data['exportPicturePath'] = this.exportPicturePath;
    data['custom1'] = this.custom1;
    data['custom2'] = this.custom2;
    data['custom3'] = this.custom3;
    return data;
  }
}
