import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:pcgo/view/screen/myprocess/myprocess_main_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/process_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../../basewidget/textfield/custom_text_textfield.dart';

class MyProcessTempEstimatePage extends StatefulWidget {
  final ProcessModel processModel;

  const MyProcessTempEstimatePage({Key key, this.processModel})
      : super(key: key);

  @override
  State<MyProcessTempEstimatePage> createState() =>
      _MyProcessTempEstimatePageState();
}

class _MyProcessTempEstimatePageState extends State<MyProcessTempEstimatePage>
    with TickerProviderStateMixin {
  var aluminumWheelList = [];
  var carConditionList = [];

  String getTimeToString(String src) {
    return DateFormat('yyyy-MM-dd')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(src));
  }

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

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('TEMP_ESTIMATE', context)}",).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${getTranslated('REQUEST_FORM_TEXT1', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Text(
                                  "${getTranslated('REQUEST_FORM_TEXT2', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated('REQUEST_FORM_TEXT3', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${getTranslated('REQUEST_FORM_TEXT4', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('MODEL_NAME', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText: "${widget.processModel.model}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('YEAR_MODEL', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText: "${widget.processModel.yearModel}${getTranslated('YEAR', context)}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('ENROLL_DATE', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText:
                                  "${getTimeToString(widget.processModel.registerDate)}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DETAIL_MODEL', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText: "${widget.processModel.detailModel}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('DISPLACEMENT', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText:
                                  "${NumberFormat('###,###,###,###').format(widget.processModel.displacement)} cc",
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
                            CustomTextField(
                              hintText:
                                  "${carConditionList[widget.processModel.carCondition ?? 0]}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            // Text(
                            //   "차량 파손 여부",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //     height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomTextField(
                            //   hintText: "전체파손",
                            // ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
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
                            CustomTextField(
                              hintText:
                                  "${aluminumWheelList[widget.processModel.aluminumWheel ?? 0]}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('ATTACHMENT', context)}/${getTranslated('MORTGAGE', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            CustomTextField(
                              hintText:
                                  "${getTranslated('ATTACHMENT', context)} ${widget.processModel.attachment ?? 0}${getTranslated('COUNT_UNIT', context)} / ${getTranslated('MORTGAGE', context)} ${widget.processModel.mortgage ?? 0}${getTranslated('COUNT_UNIT', context)}",
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('ESTIMATE', context)}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0XFF2434D7),
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
                                hintText:
                                    "${NumberFormat('###,###,###,###').format(widget.processModel.estimation ?? 0)}원",
                                isBorder: true,
                                borderColor: Color(0XFF2434D7),
                                fillColor: Colors.white,
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            Text(
                              "${getTranslated('CATALYST_TEXT', context)}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  // fontSize: 14,
                                  color: Color(0XFF2434D7),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
/*
                            InkWell(
                              onTap: () {
                                // _showDialog();
                              },
                              child: Text(
                                "   촉매란? [내용보기]",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    // fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
*/
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: CustomOutlinedButton(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      buttonText: "${getTranslated('CANCEL', context)}",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: CustomElevatedButton(
                                      onTap: () {
                                        if (widget.processModel.state == 2) {
                                          widget.processModel.state = 3;
                                          widget.processModel.date2 =
                                              DateFormat("yyyy-MM-dd hh:mm:ss")
                                                  .format(DateTime.now());

                                          Provider.of<ProcessProvider>(context,
                                                  listen: false)
                                              .updateProcess(
                                                  widget.processModel);
                                        }

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MyProcessMainPage()),
                                                (route) => false);
                                      },
                                      buttonText: "${getTranslated('CONFIRM', context)}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      widget.processModel.exportable == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${getTranslated('EXPORT_TEXT1', context)}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          // fontSize: 14,
                                          color: Color(0xff2007d6),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        "${getTranslated('EXPORT_TEXT2', context)}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          // fontSize: 14,
                                          color: Color(0xff2007d6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      // Navigator.of(context).pop();
                                      _showDialog();
                                    },
                                    buttonText: "${getTranslated('EXPORT_TEXT3', context)}",
                                  ),
                                ),
                              ],
                            )
                          : Container(),
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
      builder: (BuildContext context) => Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          // title: new Text("Dialog Title"),
          content: Column(
            children: [
              Text(
                "${getTranslated('IMAGE_ENROLL1', context)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${getTranslated('IMAGE_ENROLL2', context)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: CustomTextField(
                        hintText: "${getTranslated('IMAGE_ENROLL3', context)}",
                        isBorder: true,
                        borderRadius: 2.0,
                        borderColor: Color(0xff707070),
                        boxColor: Colors.white,
                        fillColor: Colors.white,
                        textAlign: TextAlign.center,
                        textColor: Color(0xffdddddd),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${getTranslated('IMAGE_ENROLL4', context)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: CustomTextField(
                        hintText: "${getTranslated('IMAGE_ENROLL3', context)}",
                        isBorder: true,
                        borderRadius: 2.0,
                        borderColor: Color(0xff707070),
                        boxColor: Colors.white,
                        fillColor: Colors.white,
                        textAlign: TextAlign.center,
                        textColor: Color(0xffdddddd),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${getTranslated('IMAGE_ENROLL5', context)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: CustomTextField(
                        hintText: "${getTranslated('IMAGE_ENROLL3', context)}",
                        isBorder: true,
                        borderRadius: 2.0,
                        borderColor: Color(0xff707070),
                        boxColor: Colors.white,
                        fillColor: Colors.white,
                        textAlign: TextAlign.center,
                        textColor: Color(0xffdddddd),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${getTranslated('IMAGE_ENROLL6', context)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: CustomTextField(
                        hintText: "${getTranslated('IMAGE_ENROLL3', context)}",
                        isBorder: true,
                        borderRadius: 2.0,
                        borderColor: Color(0xff707070),
                        boxColor: Colors.white,
                        fillColor: Colors.white,
                        textAlign: TextAlign.center,
                        textColor: Color(0xffdddddd),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "${getTranslated('IMAGE_ENROLL7', context)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: CustomTextField(
                        hintText: "${getTranslated('IMAGE_ENROLL3', context)}",
                        isBorder: true,
                        borderRadius: 2.0,
                        borderColor: Color(0xff707070),
                        boxColor: Colors.white,
                        fillColor: Colors.white,
                        textAlign: TextAlign.center,
                        textColor: Color(0xffdddddd),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            ],
          ),
          actions: <Widget>[
            Container(
              child: CupertinoDialogAction(
                child: Container(
                  child: Text(
                    "${getTranslated('ENROLL', context)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => MyProcessRealEstimatePage()));
                },
              ),
              decoration: BoxDecoration(
                color: Color(0XFF2434D7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
