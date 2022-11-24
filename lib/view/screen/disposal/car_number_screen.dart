import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:pcgo/view/basewidget/textfield/custom_car_number_textfield.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/process_model.dart';
import '../../../provider/process_provider.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';
import '../home/home_screens.dart';
import 'car_basic_info_screen.dart';

class CarNumberPage extends StatefulWidget {
  @override
  State<CarNumberPage> createState() => _CarNumberPageState();
}

class _CarNumberPageState extends State<CarNumberPage>
    with TickerProviderStateMixin {
  bool _radioValue = true;
  bool _inputFormValue = false;
  TextEditingController _textEditingController = TextEditingController();

  void setStateButtonValue(value) {
    setState(() {
      _inputFormValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("내 차량번호 입력").getAppbar(),

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
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.fromLTRB(
                          16.0,
                          16.0,
                          16.0,
                          0.0,
                        ),
                        padding: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.black12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "폐차 견적을 위해",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "조회하실 차량 정보",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff212121),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "를 입력해주세요.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff212121),
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCarNumberTextField(
                                _textEditingController,
                                function: setStateButtonValue,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 4.0, 0.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Color(0XFF2434D7),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _radioValue = !_radioValue;
                                  });
                                },
                                child: CustomRadioButton(
                                  _radioValue,
                                  "개인정보 수집 동의",
                                  Color(0XFF2434D7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _radioValue && _inputFormValue
                            ? CustomElevatedButton(
                                onTap: () async {
                                  //ref 국토부 조회 api 연동
                                  String model = "K7";
                                  String yearModel = "22년형";
                                  String enrollDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse('2020-01-02T03:04:05Z'));

                                  ProcessModel processModel = ProcessModel(
                                    // state: 1,
                                    carNum: _textEditingController.text,
                                    model: model,
                                    yearModel: yearModel,
                                    registerDate: enrollDate,
                                  );

                                  await Provider.of<ProcessProvider>(context, listen: false)
                                      .getProcessByCarNum(processModel);

                                  //ref 기존 차판번호가 등록되어 있으면서, process state 가 1 이면 '폐라를 진행중입니다.' 알럿을 띄우고 홈으로 간다. 아니면 그냥 진행한다.
                                  if(Provider.of<ProcessProvider>(context, listen: false).process == null) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => CarBasicInfoPage(
                                          processModel: processModel,
                                        ),
                                      ),
                                    );
                                  } else {
                                    _showDialog();
                                  }
                                },
                                buttonText: '내 차 정보 보기',
                              )
                            : CustomElevatedButton(
                                onTap: () {},
                                buttonText: '내 차 정보 보기',
                                backgroundColor: Colors.grey,
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
                "",
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
                    "폐차 진행 중입니다.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("취소"),
              onPressed: () {
                return Navigator.pop(context);
              },
            ),
            Container(
              child: CupertinoDialogAction(
                child: Container(
                  child: Text(
                    "확인",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
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
