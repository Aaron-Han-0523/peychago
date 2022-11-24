import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/model/response/clients_model.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/disposal/estimate_screen.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../../basewidget/textfield/custom_small_car_number_textfield.dart';
import '../../basewidget/textfield/custom_text_textfield.dart';

class CarDetailInfoPage extends StatefulWidget {
  final ProcessModel processModel;

  const CarDetailInfoPage({
    Key key,
    this.processModel,
  }) : super(key: key);

  @override
  State<CarDetailInfoPage> createState() => _CarDetailInfoPageState();
}

class _CarDetailInfoPageState extends State<CarDetailInfoPage>
    with TickerProviderStateMixin {
  bool _infoValue = false;
  bool _phoneInfoValue = false;
  TextEditingController phoneNumTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  // alert dialog 가 상태가 변경된 값을 반영하지 못해서 추가한 코드(stateful 하게 stateBuilder 활용)
  StateSetter _setState;

  List<_EstimateData> data = [];

  //ref  carInfo price 는 폐차예상금액에 넣어준다.
  // 1-1) 국토부 api로 model, yearModel 받아야 한다.
  // 1-2) carInfo에서 해당 model, yearModel을 조회해서 carInfo에서 price 받아야 한다.
  int price = 500;
  int todayMetalPrice = 10000;

  @override
  Widget build(BuildContext context) {
    data = [
      _EstimateData('0', 6000),
      _EstimateData('5${getTranslated('TEN_THOUSAND', context)} km', 5100),
      _EstimateData('10${getTranslated('TEN_THOUSAND', context)} km', 4000),
      _EstimateData('15${getTranslated('TEN_THOUSAND', context)} km', 3700),
      _EstimateData('20${getTranslated('TEN_THOUSAND', context)} km', 2000)
    ];

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('MY_CAR_DETAIL', context)}").getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
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

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(16.0),
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Color(0XFF2434D7),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                              child: CustomSmallCarNumberTextField(
                                  widget.processModel.carNum),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${widget.processModel.model} ",
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${widget.processModel.yearModel}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        "${widget.processModel.registerDate.substring(0, 4)}${getTranslated('YEAR', context)} ${widget.processModel.registerDate.substring(5, 7)}${getTranslated('MONTH', context)} ${widget.processModel.registerDate.substring(8, 10)}${getTranslated('DAY', context)}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    Images.inquiry_car,
                                    height: 45,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.white,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('OWNER', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: "${widget.processModel.ownerName}",
                              isBorder: true,
                              borderColor: Colors.black12,
                              fillColor: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DETAIL_MODEL', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              hintText: "${widget.processModel.detailModel}",
                              isBorder: true,
                              borderColor: Colors.black12,
                              fillColor: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DISPLACEMENT', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            CustomTextField(
                              // hintText: "1,999 cc",
                              hintText:
                                  "${NumberFormat('###,###,###,###').format(widget.processModel.displacement)} cc",
                              isBorder: true,
                              borderColor: Colors.black12,
                              fillColor: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                          ],
                        ),
                      ),

                      Container(
                          // alignment: Alignment.centerRight,
                          margin: const EdgeInsets.all(16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Color(0XFF2434D7),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${getTranslated('ESTIMATE_TEXT1', context)} ${NumberFormat('###,###,###,###').format(price)}${getTranslated('MONEY_UNIT', context)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF2434D7),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      // decorationStyle: TextDecorationStyle.dashed
                                    ),
                                  ),
                                  Text(
                                    "${getTranslated('ESTIMATE_TEXT2', context)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${getTranslated('ESTIMATE_TEXT3', context)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${getTranslated('ESTIMATE_TEXT4', context)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF2434D7),
                                      fontWeight: FontWeight.bold,
                                      // decoration: TextDecoration.underline,
                                      // decorationStyle: TextDecorationStyle.dashed
                                    ),
                                  ),
                                  Text(
                                    "${getTranslated('ESTIMATE_TEXT5', context)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                              Center(
                                child: Text(
                                  "${getTranslated('ESTIMATE_TEXT6', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0XFF2434D7),
                                    fontWeight: FontWeight.bold,
                                    // decoration: TextDecoration.underline,
                                    // decorationStyle: TextDecorationStyle.dashed
                                  ),
                                ),
                              ),
                            ],
                          )),

                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "모델명",
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.black),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextTextField(
                            //   hintText: "100가 1234",
                            //   isBorder: true,
                            //   borderColor: Colors.black12,
                            //   fillColor: Colors.white70,
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "연식",
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.black),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextTextField(
                            //   hintText: "100가 1234",
                            //   isBorder: true,
                            //   borderColor: Colors.black12,
                            //   fillColor: Colors.white70,
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "최초등록일",
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.black),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextTextField(
                            //   hintText: "100가 1234",
                            //   isBorder: true,
                            //   borderColor: Colors.black12,
                            //   fillColor: Colors.white70,
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "원동기 형식",
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.black),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextTextField(
                            //   hintText: "100가 1234",
                            //   isBorder: true,
                            //   borderColor: Colors.black12,
                            //   fillColor: Colors.white70,
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "배기량",
                            //   style:
                            //       TextStyle(fontSize: 14, color: Colors.black),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextTextField(
                            //   hintText: "100가 1234",
                            //   isBorder: true,
                            //   borderColor: Colors.black12,
                            //   fillColor: Colors.white70,
                            // ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Center(
                        child: Text(
                          "${getTranslated('MEDIUM_COST', context)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            // Chart title
                            // title: ChartTitle(text: '평균 폐차 시세'),
                            // Enable legend
                            // legend: Legend(isVisible: true),
                            // Enable tooltip
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries<_EstimateData, String>>[
                              LineSeries<_EstimateData, String>(
                                  dataSource: data,
                                  xValueMapper: (_EstimateData estimate, _) =>
                                      estimate.distance,
                                  yValueMapper: (_EstimateData estimate, _) =>
                                      estimate.price,
                                  // name: '평균 폐차 시세',
                                  // Enable data label
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true))
                            ]),
                      ),
                      SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0XFF2434D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Color(0XFF2434D7),
                                    ),
                                    child: Text(
                                      "${getTranslated('TODAY_METAL_COST', context)}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(8.0),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0XFF2434D7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${getTranslated('TODAY_METAL_COST2', context)}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0XFF2434D7),
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_EXTRA_SMALL),
                                        Text(
                                          "${NumberFormat('###,###,###,###').format(todayMetalPrice)}",
                                          style: TextStyle(
                                              color: Color(0XFF2434D7),
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  Images.scrap_metal,
                                  fit: BoxFit.fill,
                                ), // Text(key['title']),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0XFF2434D7),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            _showDialog();
                          },
                          child: CustomSmallRadioButton(
                              _infoValue, "${getTranslated('AGREE_TEXT', context)}"),
                        ),
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${getTranslated('DISPOSAL_CAR_TEXT1', context)}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "${getTranslated('DISPOSAL_CAR_TEXT2', context)}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                          Text(
                            "${getTranslated('DISPOSAL_CAR_TEXT3', context)}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: _infoValue
                                    ? CustomElevatedButton(
                                        onTap: () {
                                          _showDialog2();
                                        },
                                        buttonText: '${getTranslated('RECEIVE_ESTIMATE_TEXT', context)}',
                                      )
                                    : CustomElevatedButton(
                                        onTap: () {},
                                        buttonText: '${getTranslated('RECEIVE_ESTIMATE_TEXT', context)}',
                                        backgroundColor: Colors.grey,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                    "${getTranslated('AGREE_TEXT1', context)}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Text(
                        "${getTranslated('AGREE_TEXT2', context)}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${getTranslated('AGREE_TEXT3', context)}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(
                    "${getTranslated('AGREE_TEXT4', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF2434D7),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("${getTranslated('CANCEL', context)}"),
                  onPressed: () {
                    setState(() {
                      _infoValue = false;
                    });
                    return Navigator.pop(context);
                  },
                ),
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "${getTranslated('CONFIRM', context)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _infoValue = true;
                      });
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

  void _showDialog2() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${getTranslated('AGREE_TEXT5', context)}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Row(
                      children: [
                        Text(
                          "${getTranslated('AGREE_TEXT6', context)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${getTranslated('AGREE_TEXT7', context)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${getTranslated('AGREE_TEXT8', context)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Row(
                      children: [
                        Text(
                          "${getTranslated('AGREE_TEXT9', context)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${getTranslated('AGREE_TEXT10', context)}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Text(
                      "${getTranslated('PHONE_NUMBER', context)}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Material(
                      // elevation: 20.0,
                      // shadowColor: Color(0XFF2434D7),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      // decoration: InputDecoration(
                      //   // icon: new Icon(Icons.circle, color: Colors.grey),
                      //   hintText: '100가1234',
                      //   fillColor: Colors.white,
                      //   filled: true,
                      //   counterText: '',
                      //   focusedBorder: OutlineInputBorder(
                      //     borderSide: BorderSide(color: Colors.white),
                      //   ),
                      //   contentPadding:
                      //   EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //   enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(5.0),
                      //     borderSide:
                      //     BorderSide(color: Colors.white, width: 3.0),
                      //   ),
                      // ),
                      child: CustomAlertTextTextField(
                        // isPhoneNumber: true,
                        controller: phoneNumTextEditingController,
                        hintText: "${getTranslated('PHONE_NUMBER_HINT_TEXT', context)}",
                        isBorder: true,
                        // fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Text(
                      "${getTranslated('AGREE_TEXT9', context)}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Material(
                      // elevation: 20.0,
                      // shadowColor: Color(0XFF2434D7),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),

                      child: CustomAlertTextTextField(
                        controller: passwordTextEditingController,
                        hintText: "${getTranslated('PASSWORD_HINT_TEXT', context)}",
                        isBorder: true,
                        isPassword: true,
                        // fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    StatefulBuilder(
                      // You need this, notice the parameters below:
                      builder: (BuildContext context, StateSetter setState) {
                        _setState = setState;
                        return Material(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white),
                            // padding: EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () => _setState(() {
                                      _phoneInfoValue = !_phoneInfoValue;
                                    }),
                                child: CustomSmallRadioButton(_phoneInfoValue,
                                    "${getTranslated('AGREE_TEXT11', context)}")),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("${getTranslated('CANCEL', context)}",),
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                ),
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "${getTranslated('CONFIRM', context)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      if (_phoneInfoValue) {
                        ClientsModel clientsModel = ClientsModel(
                          clientName: widget.processModel.ownerName,
                          phoneNum: phoneNumTextEditingController.text,
                          password: passwordTextEditingController.text,
                          carNum: widget.processModel.carNum,
                        );

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => EstimatePage(
                              processModel: widget.processModel,
                              clientsModel: clientsModel,
                            ),
                          ),
                        );
                      }
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

class _EstimateData {
  _EstimateData(this.distance, this.price);

  final String distance;
  final double price;
}
