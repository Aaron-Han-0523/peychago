import 'package:flutter/material.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/textfield/custom_small_car_number_textfield.dart';
import 'car_detail_info_screen.dart';

class CarBasicInfoPage extends StatefulWidget {
  final ProcessModel processModel;

  const CarBasicInfoPage(
      {Key key, this.processModel})
      : super(key: key);

  @override
  State<CarBasicInfoPage> createState() => _CarBasicInfoPageState();
}

class _CarBasicInfoPageState extends State<CarBasicInfoPage>
    with TickerProviderStateMixin {
  TextEditingController clientNameTextEditingController =
      TextEditingController();
  bool _inputFormValue = false;

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
              CustomSliverAppBar("${getTranslated('MY_CAR_DEFAULT', context)}").getAppbar(),

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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('BASIC_TEXT1', context)}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff212121),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${getTranslated('BASIC_TEXT2', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${getTranslated('BASIC_TEXT3', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
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
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.fromLTRB(
                          16.0,
                          16.0,
                          16.0,
                          8.0,
                        ),
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
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
                                        "${widget.processModel.registerDate.substring(0, 4)}년 ${widget.processModel.registerDate.substring(5, 7)}월 ${widget.processModel.registerDate.substring(8, 10)}일",
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
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        // margin: const EdgeInsets.all(4.0),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Container(
                                          height: 30,
                                          child: TextFormField(
                                            controller:
                                                clientNameTextEditingController,
                                            // obscureText: true,
                                            autofocus: false,
                                            // readOnly: true,
                                            // enabled: false,
                                            style: TextStyle(fontSize: 16.0),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              // icon: new Icon(Icons.circle, color: Colors.grey),
                                              hintText: '${getTranslated('OWNER_NAME_INPUT', context)}',
                                              fillColor: Colors.white,
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      5.0, 20.0, 5.0, 0.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              border: InputBorder.none,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                                borderSide:
                                                BorderSide(color: Colors.white, width: 3.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomOutlinedButton(
                                      onTap: () {
                                        //ref 국토부 조회 api 연동
                                        String ownerName = clientNameTextEditingController.text;
                                        String detailModel = "G4KD"; // 원동기 형식
                                        int displacement = 19999; // 배기량
                                        // String registerDate = "2022년 11월 15일"; // 배기량
                                        // 기타 국토부 api 연동 데이터 ...

                                        widget.processModel.ownerName = ownerName;
                                        widget.processModel.detailModel = detailModel;
                                        widget.processModel.displacement = displacement;
                                        // widget.processModel.registerDate = registerDate;
                                        // 기타 국토부 api 연동 object 데이터 ...

                                        setStateButtonValue(true);
                                      },
                                      buttonText: '${getTranslated('FIND', context)}',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: CustomOutlinedButton(
                                  onTap: () {
                                    if (_inputFormValue) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CarDetailInfoPage(
                                                processModel: widget.processModel,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  buttonText: '${getTranslated('ESTIMATE_SHOW', context)}',
                                  borderColor: _inputFormValue
                                      ? Color(0XFF2434D7)
                                      : Colors.grey,
                                  textColor: _inputFormValue
                                      ? Color(0XFF2434D7)
                                      : Colors.grey,
                                ),
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
}
