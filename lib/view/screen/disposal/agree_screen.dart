import 'package:flutter/material.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/basewidget/button/custom_elevated_button.dart';
import 'package:pcgo/view/screen/disposal/car_number_screen.dart';

import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';
import '../../basewidget/textarea/custom_textarea.dart';
import '../home/widget/footer_screens.dart';

class AgreePage extends StatefulWidget {
  @override
  State<AgreePage> createState() => _AgreePageState();
}

class _AgreePageState extends State<AgreePage> with TickerProviderStateMixin {
  bool _value = false;
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _confirmButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: DefaultAppBarButton("차량 폐차 견적 조회를 위한 약관").getAppbar(),
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('AGREE', context)}").getAppbar(),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Divider(
                      height: 5,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black12,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width + 100,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              // padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                      8.0,
                                      0.0,
                                      0.0,
                                      0.0,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _value = !_value;
                                          _value1 = _value;
                                          _value2 = _value;
                                          _value3 = _value;

                                          if (_value1 && _value2 && _value3)
                                            _value = true;
                                          else
                                            _value = false;
                                          if (_value1 && _value2)
                                            _confirmButton = true;
                                          else
                                            _confirmButton = false;
                                        });
                                      },
                                      child: CustomRadioButton(
                                        _value,
                                        "${getTranslated('AGREE2', context)}",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              // padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          8.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _value1 = !_value1;
                                              if (_value1 && _value2 && _value3)
                                                _value = true;
                                              else
                                                _value = false;
                                              if (_value1 && _value2)
                                                _confirmButton = true;
                                              else
                                                _confirmButton = false;
                                            });
                                          },
                                          child: CustomRadioButton(
                                            _value1,
                                            "${getTranslated('AGREE3', context)}",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 5,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.black12,
                                  ),
                                  CustomTextarea(
                                    textEditingController:
                                        TextEditingController(
                                      text: '''
Ⅰ. 개인정보의 수집 및 이용 동의서
 - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.
① 개인정보 수집 항목 및 수집·이용 목적
 가) 수집 항목 (필수항목)
- 성명(국문), 차량번호, 전화번호(자택, 휴대전화), 사진, 이메일 등 폐차신청서에 기재된 정보 또는 신청자가 제공한 정보
 나) 수집 및 이용 목적
- 폐차GO 폐차 상담
- 파트너 폐차 업체 제안 폐차 견적
 ② 개인정보 보유 및 이용기간
 - 수집·이용 동의일로부터 개인정보의 수집·이용목적을 달성할 때까지
 ③ 동의거부관리
 - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여 동의를 거부하실 권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에 있어 불이익이 발생할 수 있음을 알려드립니다.
''',
                                    ),
                                    isBorder: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              // padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          8.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _value2 = !_value2;
                                              if (_value1 && _value2 && _value3)
                                                _value = true;
                                              else
                                                _value = false;
                                              if (_value1 && _value2)
                                                _confirmButton = true;
                                              else
                                                _confirmButton = false;
                                            });
                                          },
                                          child: CustomRadioButton(
                                              _value2, "${getTranslated('AGREE4', context)}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 5,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.black12,
                                  ),
                                  CustomTextarea(
                                    textEditingController:
                                        TextEditingController(
                                      text:
                                          'Please enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of text',
                                    ),
                                    isBorder: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              // padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black12,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          8.0,
                                          0.0,
                                          0.0,
                                          0.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              _value3 = !_value3;
                                              if (_value1 && _value2 && _value3)
                                                _value = true;
                                              else
                                                _value = false;
                                              if (_value1 && _value2)
                                                _confirmButton = true;
                                              else
                                                _confirmButton = false;
                                            });
                                          },
                                          child: CustomRadioButton(
                                              _value3, "${getTranslated('AGREE5', context)}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 5,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.black12,
                                  ),
                                  CustomTextarea(
                                    textEditingController:
                                        TextEditingController(
                                      text:
                                          'Please enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of textot of textPlease enter a lot of textPlease enter a lot of text',
                                    ),
                                    isBorder: false,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            Container(
                              margin: EdgeInsets.all(8.0),
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
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: _confirmButton
                                          ? CustomElevatedButton(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CarNumberPage()));
                                              },
                                              buttonText: '${getTranslated('CONFIRM', context)}',
                                              backgroundColor:
                                                  Color(0XFF2434D7),
                                            )
                                          : CustomElevatedButton(
                                              onTap: () {},
                                              buttonText: '${getTranslated('CONFIRM', context)}',
                                              backgroundColor: Colors.grey,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                          ],
                        ),
                      ),
                    ),
                    FooterPage(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
