import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pcgo/data/model/response/process_model.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/process_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../../basewidget/textfield/custom_text_textfield.dart';
import 'myprocess_main_screen.dart';

class MyProcessRealEstimatePage extends StatefulWidget {
  final ProcessModel processModel;

  const MyProcessRealEstimatePage({Key key, this.processModel}) : super(key: key);

  @override
  State<MyProcessRealEstimatePage> createState() =>
      _MyProcessRealEstimatePageState();
}

class _MyProcessRealEstimatePageState extends State<MyProcessRealEstimatePage>
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
              CustomSliverAppBar("${getTranslated('REAL_ESTIMATE', context)}",).getAppbar(),

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
                                  "${getTranslated('REAL_REQUEST_FORM_TEXT1', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Text(
                                  "${getTranslated('REAL_REQUEST_FORM_TEXT2', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT3', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT4', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT5', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT6', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                      ),
                                    ),
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT7', context)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${getTranslated('REAL_REQUEST_FORM_TEXT8', context)}",
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
                              hintText: "${widget.processModel.yearModel}년",
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
                              hintText: "${getTimeToString(widget.processModel.registerDate)}",
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
                              hintText: "${NumberFormat('###,###,###,###').format(widget.processModel.displacement)} cc",
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
                              hintText: "${carConditionList[widget.processModel.carCondition??0]}",
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
                              hintText: "${aluminumWheelList[widget.processModel.aluminumWheel??0]}",
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
                              hintText: "${getTranslated('ATTACHMENT', context)} ${widget.processModel.attachment ?? 0}${getTranslated('COUNT_UNIT', context)} / ${getTranslated('MORTGAGE', context)} ${widget.processModel.mortgage ?? 0}${getTranslated('COUNT_UNIT', context)}",

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
                                  hintText: "${NumberFormat('###,###,###,###').format(widget.processModel.quotation??0)}원",
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
                                        // 실제 프로세스 state는 date index와 상이하다. 이유는 중간에 고객 확인 과정이 필요하고, 그런데 그것을 화면에 나타내지는 않는다.
                                        if(widget.processModel.state == 6) {
                                          widget.processModel.state = 7;
                                          widget.processModel.date5 = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());

                                          Provider.of<ProcessProvider>(context, listen: false)
                                              .updateProcess(widget.processModel);
                                        }

                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (_) => MyProcessMainPage()),
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


}
