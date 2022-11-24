import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/basewidget/dropdown/CustomDropdownButton2.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/model/response/clients_model.dart';
import '../../../data/model/response/process_model.dart';
import '../../../data/model/response/request_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/clients_provider.dart';
import '../../../provider/request_provider.dart';
import '../../../provider/process_provider.dart';

import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../home/home_screens.dart';

class EstimatePage extends StatefulWidget {
  final ProcessModel processModel;
  final ClientsModel clientsModel;

  const EstimatePage({
    Key key,
    this.processModel,
    this.clientsModel,
  }) : super(key: key);

  @override
  State<EstimatePage> createState() => _EstimatePageState();
}

class _EstimatePageState extends State<EstimatePage>
    with TickerProviderStateMixin {
  final List<String> timeDropdownItems = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
  ];

  List<String> aluminumWheelList = [];
  List<String> carConditionList = [];

  String carCondition = "";
  String aluminumWheel = "";

  bool isCopyPlaceChecked = false;

  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  String postCode2 = '-';
  String address2 = '-';
  String latitude2 = '-';
  String longitude2 = '-';
  String kakaoLatitude2 = '-';
  String kakaoLongitude2 = '-';

  TextEditingController realAddressTextEditingController =
      TextEditingController();
  TextEditingController receivePlaceTextEditingController =
      TextEditingController();

  TextEditingController receiveMonthTextEditingController =
      TextEditingController();
  TextEditingController receiveDayTextEditingController =
      TextEditingController();

  String receiveTimeStart = "14";
  String receiveTimeEnd = "15";

  TextEditingController receivePhoneNumberTextEditingController;
  TextEditingController receiveEmailStartTextEditingController =
      TextEditingController();
  TextEditingController receiveEmailEndTextEditingController =
      TextEditingController();
  TextEditingController receiveBankTextEditingController =
      TextEditingController();
  TextEditingController receiveAccountTextEditingController =
      TextEditingController();
  TextEditingController receiveAccountOwnerTextEditingController =
      TextEditingController();
  TextEditingController receiveBankTextEditingController2 =
      TextEditingController();
  TextEditingController receiveAccountTextEditingController2 =
      TextEditingController();
  TextEditingController receiveAccountOwnerTextEditingController2 =
      TextEditingController();

  // TextEditingController receiveCarConditionTextEditingController =
  //     TextEditingController();
  // TextEditingController receiveCarDamageTextEditingController =
  //     TextEditingController();
  // TextEditingController receiveAluminumWheelTextEditingController =
  //     TextEditingController();


  @override
  Widget build(BuildContext context) {
    aluminumWheelList = [
      "O",
      "X",
      "${getTranslated('DO_NOT_KNOW', context)}",
    ];
    carConditionList = [
      "${getTranslated('CAR_CONDITION_WELL', context)}",
      "${getTranslated('CAR_CONDITION_ACCIDENT', context)}",
      "${getTranslated('CAR_CONDITION_BAD', context)}",
    ];

    carCondition = carConditionList[0];
    aluminumWheel = aluminumWheelList[0];

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('RECEIVE_ESTIMATE', context)}").getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  // margin: const EdgeInsets.all(8.0),
                  // padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black12,
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('NAME', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                hintText: "${widget.processModel.ownerName}",
                                enabled: false,
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('REAL_ADDRESS', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomAlertTextTextField(
                                      hintText: "$postCode",
                                      enabled: false,
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 0.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 16),
                                              backgroundColor:
                                                  Color(0XFF2434D7),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => KpostalView(
                                                    useLocalServer: true,
                                                    localPort: 1024,
                                                    // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                                    callback: (Kpostal result) {
                                                      setState(() {
                                                        this.postCode =
                                                            result.postCode;
                                                        this.address =
                                                            result.address;
                                                        this.latitude = result
                                                            .latitude
                                                            .toString();
                                                        this.longitude = result
                                                            .longitude
                                                            .toString();
                                                        this.kakaoLatitude =
                                                            result.kakaoLatitude
                                                                .toString();
                                                        this.kakaoLongitude =
                                                            result
                                                                .kakaoLongitude
                                                                .toString();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text("${getTranslated('SEARCH', context)}"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                hintText: "$address",
                                enabled: false,
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller: realAddressTextEditingController,
                                hintText: "",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DIFFERENT_PLACE_TEXT', context)}",
                              // maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  // fontSize: 14,
                                  color: Color(0XFF2434D7),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DIFFERENT_PLACE', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomAlertTextTextField(
                                      hintText: "$postCode2",
                                      enabled: false,
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 0.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 16),
                                              backgroundColor:
                                                  Color(0XFF2434D7),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => KpostalView(
                                                    useLocalServer: true,
                                                    localPort: 1024,
                                                    // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                                    callback: (Kpostal result) {
                                                      setState(() {
                                                        this.postCode2 =
                                                            result.postCode;
                                                        this.address2 =
                                                            result.address;
                                                        this.latitude2 = result
                                                            .latitude
                                                            .toString();
                                                        this.longitude2 = result
                                                            .longitude
                                                            .toString();
                                                        this.kakaoLatitude2 =
                                                            result.kakaoLatitude
                                                                .toString();
                                                        this.kakaoLongitude2 =
                                                            result
                                                                .kakaoLongitude
                                                                .toString();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text('${getTranslated('SEARCH', context)}'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                hintText: "$address2",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller: receivePlaceTextEditingController,
                                hintText: "",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('HOPE_DATE', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Material(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    child: CustomAlertTextTextField(
                                      controller:
                                          receiveMonthTextEditingController,
                                      hintText: "${DateFormat('MM').format(DateTime.now())}",
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text("${getTranslated('MONTH', context)}"),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomAlertTextTextField(
                                      controller:
                                          receiveDayTextEditingController,
                                      hintText: "${DateFormat('dd').format(DateTime.now())}",
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text("${getTranslated('DAY', context)}"),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('HOPE_TIME', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomDropdownButton2(
                                      hint: '${getTranslated('TIME', context)}',
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                      dropdownItems: timeDropdownItems,
                                      value: receiveTimeStart,
                                      onChanged: (value) {
                                        setState(() {
                                          receiveTimeStart = value + "";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text("~"),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomDropdownButton2(
                                      hint: '${getTranslated('TIME', context)}',
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                      dropdownItems: timeDropdownItems,
                                      value: receiveTimeEnd,
                                      onChanged: (value) {
                                        setState(() {
                                          receiveTimeEnd = value + "";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(
                              "${getTranslated('CONTACT', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller:
                                    receivePhoneNumberTextEditingController =
                                        TextEditingController(
                                            text:
                                                "${widget.clientsModel.phoneNum}"),
                                // hintText: "${widget.clientsModel.phoneNum}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('EMAIL', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomAlertTextTextField(
                                      controller:
                                          receiveEmailStartTextEditingController,
                                      hintText: "",
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Text("@"),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),

                                    child: CustomAlertTextTextField(
                                      controller:
                                          receiveEmailEndTextEditingController,
                                      hintText: "",
                                      isBorder: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('ACCOUNT_TITLE', context)} 1",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller: receiveBankTextEditingController,
                                hintText: "${getTranslated('ACCOUNT_BANK', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller: receiveAccountTextEditingController,
                                hintText: "${getTranslated('ACCOUNT_NUMBER', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller:
                                    receiveAccountOwnerTextEditingController,
                                hintText: "${getTranslated('ACCOUNT_HOLDER', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('ACCOUNT_TITLE', context)} 2",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller: receiveBankTextEditingController2,
                                hintText: "${getTranslated('ACCOUNT_BANK', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller:
                                    receiveAccountTextEditingController2,
                                hintText: "${getTranslated('ACCOUNT_NUMBER', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller:
                                    receiveAccountOwnerTextEditingController2,
                                hintText: "${getTranslated('ACCOUNT_HOLDER', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('CAR_CONDITION', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomDropdownButton2(
                                // hint: '시간',
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                dropdownItems: carConditionList,
                                value: carCondition,
                                buttonWidth: 10000,
                                onChanged: (value) {
                                  setState(() {
                                    carCondition = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            /*Text(
                              "차량 파손 여부",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomAlertTextTextField(
                                controller:
                                    receiveCarDamageTextEditingController,
                                hintText: "전체파손",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),*/
                            Text(
                              "${getTranslated('ALUMINUM_WHEEL', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Material(
                              // elevation: 20.0,
                              // shadowColor: Color(0XFF2434D7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),

                              child: CustomDropdownButton2(
                                // hint: '시간',
                                icon: const Icon(Icons.keyboard_arrow_down),
                                iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                dropdownItems: aluminumWheelList,
                                value: aluminumWheel,
                                onChanged: (value) {
                                  setState(() {
                                    aluminumWheel = value;
                                  });
                                },
                                buttonWidth: 10000,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            InkWell(
                              child: Text(
                                "${getTranslated('ALUMINUM_WHEEL_TEXT', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF2434D7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => {_showDialog()},
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: CustomOutlinedButton(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        buttonText: '${getTranslated('CANCEL', context)}',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: CustomElevatedButton(
                                        onTap: () {
                                          _showDialog2(
                                            widget.processModel,
                                            widget.clientsModel,
                                          );
                                        },
                                        buttonText: '${getTranslated('CONFIRM', context)}',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE1', context)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // fontSize: 14,
                        //   color: Color(0XFF2434D7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE2', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE1', context)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // fontSize: 14,
                        color: Color(0XFF2434D7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE3', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE4', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE5', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE6', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        //   color: Color(0XFF2434D7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(Images.aluminum_wheel1,
                              height: 100, fit: BoxFit.fill),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(Images.aluminum_wheel2,
                              height: 100, fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE7', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE8', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        //   color: Color(0XFF2434D7),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(Images.iron_wheel1,
                              height: 100, fit: BoxFit.fill),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(Images.iron_wheel2,
                              height: 100, fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text(
                    "${getTranslated('ALUMINUM_WHEEL_NOTICE9', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontSize: 14,
                        // color: Color(0XFF2434D7),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                ],
              ),
              actions: <Widget>[
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "${getTranslated('CLOSE', context)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2434D7),
                  ),
                ),
              ],
            ));
  }

  void _showDialog2(
    ProcessModel processModel,
    ClientsModel clientsModel,
  ) async {
    // Navigator.pop(context);
    // validation
    if (postCode == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE1', context)}",);
    } else if (address == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE2', context)}",);
    } else if (realAddressTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE3', context)}",);
    } else if (receiveMonthTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE4', context)}",);
    } else if (receiveDayTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE5', context)}",);
    } else if (receivePhoneNumberTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE6', context)}",);
    } else if (receiveBankTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE7', context)}",);
    } else if (receiveAccountTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE8', context)}",);
    } else if (receiveAccountOwnerTextEditingController.text == "") {
      _showDialog3("${getTranslated('VALIDATION_ESTIMATE9', context)}",);
    } else {
      // 1. 차량정보 api call
      // 1-1) 국토부 api로 model, yearModel 받아야 한다.
      // 1-2) carInfo에서 해당 model, yearModel을 조회해서 carInfo_id를 process에 연결해야 한다.

      // get model, yearModel => carInfo_id

      // 2. clients info 등록하고 id를 받아와서 process table 에 등록
      clientsModel.address = postCode +
          ':::' +
          address +
          ':::' +
          realAddressTextEditingController.text;

      clientsModel.email = receiveEmailStartTextEditingController.text +
          '@' +
          receiveEmailEndTextEditingController.text;

      ApiResponse responseClients =
          await Provider.of<ClientsProvider>(context, listen: false)
              .addClients(clientsModel);

      int clientsId = responseClients.response.data['clients_id'];

      // 양호 / 사고 / 운행불가
      int carConditionCode = 0;

      if (carCondition == "${getTranslated('CAR_CONDITION_WELL', context)}") {
        carConditionCode = 0;
      } else if (carCondition == "${getTranslated('CAR_CONDITION_ACCIDENT', context)}") {
        carConditionCode = 1;
      } else if (carCondition == "${getTranslated('CAR_CONDITION_BAD', context)}") {
        carConditionCode = 2;
      } else {
        carConditionCode = 3;
      }

      // O / X / 모름
      int aluminumWheelCode = 0;

      if (aluminumWheel == 'O') {
        aluminumWheelCode = 0;
      } else if (aluminumWheel == 'X') {
        aluminumWheelCode = 1;
      } else if (aluminumWheel == "${getTranslated('DO_NOT_KNOW', context)}") {
        aluminumWheelCode = 2;
      } else {
        aluminumWheelCode = 3;
      }

      processModel.carCondition = carConditionCode;
      processModel.aluminumWheel = aluminumWheelCode;
      processModel.clients_id = clientsId;
      // processModel.carInfo_id = clientsId;

      // 3. car info 등록하고 id를 받아와서 process table 에 등록
      Provider.of<ProcessProvider>(context, listen: false)
          .addProcess(processModel);

      processModel.state = 1;
      processModel.date0 =
          DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
      // processModel.date1 =
      //     DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());

      Provider.of<ProcessProvider>(context, listen: false)
          .updateProcess(processModel);

      String deliveryDate = "";

      if (receiveMonthTextEditingController.text != "" &&
          receiveMonthTextEditingController.text != null) {
        // 월 기준으로 현재월보다 입력월이 작으면 1년을 증가시킨다.
        String year = int.parse(receiveMonthTextEditingController.text) <
                int.parse(DateFormat("MM").format(DateTime.now()))
            ? int.parse(DateFormat("yyyy").format(DateTime.now())) + 1
            : DateFormat("yyyy").format(DateTime.now());

        deliveryDate = year +
            "-" +
            receiveMonthTextEditingController.text.padLeft(2, "0") +
            "-" +
            receiveDayTextEditingController.text.padLeft(2, "0") +
            " 00:00:00";
      }

      RequestModel requestModel = RequestModel(
        carNum: processModel.carNum,
        deliveryDate: deliveryDate,
        custom1: receiveTimeStart.padLeft(2, "0"),
        custom2: receiveTimeEnd.padLeft(2, "0"),
        collectPlace: postCode2 +
            ':::' +
            address2 +
            ':::' +
            receivePlaceTextEditingController.text,
        phoneNum: receivePhoneNumberTextEditingController.text,
        bankName1: receiveBankTextEditingController.text,
        accountNum1: receiveAccountTextEditingController.text,
        accountHolder1: receiveAccountOwnerTextEditingController.text,
        bankName2: receiveBankTextEditingController2.text,
        accountNum2: receiveAccountTextEditingController2.text,
        accountHolder2: receiveAccountOwnerTextEditingController2.text,
      );

      // 4. car info 등록하고 id를 받아와서 process table 에 등록
      Provider.of<RequestProvider>(context, listen: false)
          .addRequest(requestModel);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => HomePage()),
              (route) => false);

      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          // title: new Text("Dialog Title"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${getTranslated('REQUEST_ESTIMATE', context)}",
              ),
            ],
          ),
          actions: <Widget>[
            Container(
              child: CupertinoDialogAction(
                child: Container(
                  child: Text(
                    "${getTranslated('CONFIRM', context)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              decoration: BoxDecoration(
                color: Color(0XFF2434D7),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _showDialog3(String msg) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$msg ${getTranslated('REQUEST_MESSAGE', context)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        // fontSize: 14,
                        //   color: Color(0XFF2434D7),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: <Widget>[
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "${getTranslated('CLOSE', context)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2434D7),
                  ),
                ),
              ],
            ));
  }
}
