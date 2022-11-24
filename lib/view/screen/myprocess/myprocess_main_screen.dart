import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:pcgo/view/screen/myprocess/myprocess_loading_check_car_status_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/process_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'myprocess_complete_screen.dart';
import 'myprocess_loading_disposal_screen.dart';
import 'myprocess_loading_estimate_screen.dart';
import 'myprocess_loading_receive_car_screen.dart';
import 'myprocess_real_estimate_screen.dart';
import 'myprocess_temp_estimate_screen.dart';

class MyProcessMainPage extends StatefulWidget {
  @override
  State<MyProcessMainPage> createState() => _MyProcessMainPageState();
}

class _MyProcessMainPageState extends State<MyProcessMainPage>
    with TickerProviderStateMixin {
  StepperType stepperType = StepperType.vertical;

  int _currentStep = 2;
  String date0Text = "";
  String date1Text = "";
  String date2Text = "";
  String date3Text = "";
  String date4Text = "";
  String date5Text = "";
  String date6Text = "";
  String date7Text = "";

  ProcessModel _process = ProcessModel();

  String getTimeToString(String src) {
    return DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(src));
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 7 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Step getStep(final int index, final String title, String contents1,
      String contents2, String timeText, Function onTap) {
    return Step(
      // label: Icon(Icons.ac_unit),
      title: InkWell(
        onTap: () => {tapped(index)},
        child: Text(
          // '접수',
          '$title',
          style: TextStyle(
            color:
                _currentStep >= index ? Color(0XFF2434D7) : Color(0xff999999),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      content: InkWell(
        onTap: _currentStep >= index ? onTap : null,
        child: Container(
          alignment: Alignment.center,
          // margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color:
                  _currentStep >= index ? Color(0xff252525) : Color(0xff999999),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(),
              timeText != null
                  ? Text(
                      "$timeText",
                      style: TextStyle(
                          // fontSize: 14,
                          color: _currentStep >= index
                              ? Color(0xff252525)
                              : Color(0xff999999),
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
              timeText != null
                  ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                  : Container(),
              Text(
                // "작성된 회수요청서를 업체에",
                "$contents1",
                style: TextStyle(
                  // fontSize: 14,
                  color: _currentStep >= index
                      ? Color(0xff252525)
                      : Color(0xff999999),
                  fontWeight: FontWeight.bold,
                ),
              ),
              contents2 != ""
                  ? Text(
                      "$contents2",
                      style: TextStyle(
                          // fontSize: 14,
                          color: _currentStep >= index
                              ? Color(0xff252525)
                              : Color(0xff999999),
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      isActive: true,
      state: StepState.disabled,
    );
  }

  setDatetime(ProcessModel processModel) {
    _currentStep = processModel.state;

    if (processModel.state == 3 || processModel.state == 4) _currentStep = 3;
    if (processModel.state == 5) _currentStep = 4;
    if (processModel.state == 6) _currentStep = 5;
    if (processModel.state == 7 || processModel.state == 8) _currentStep = 6;
    if (processModel.state == 9) _currentStep = 7;

    date0Text =
        processModel.date0 != null ? getTimeToString(processModel.date0) : null;
    date1Text =
        processModel.date1 != null ? getTimeToString(processModel.date1) : null;
    date2Text =
        processModel.date2 != null ? getTimeToString(processModel.date2) : null;
    date3Text =
        processModel.date3 != null ? getTimeToString(processModel.date3) : null;
    date4Text =
        processModel.date4 != null ? getTimeToString(processModel.date4) : null;
    date5Text =
        processModel.date5 != null ? getTimeToString(processModel.date5) : null;
    date6Text =
        processModel.date6 != null ? getTimeToString(processModel.date6) : null;
    date7Text =
        processModel.date7 != null ? getTimeToString(processModel.date7) : null;

    _process = processModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ProcessModel processModel =
                await Provider.of<ProcessProvider>(context, listen: false)
                    .getProcess();

            setDatetime(processModel);

            setState(() {});
          },
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('PROCESS_LEVEL_CHECK', context)}",
              ).getAppbar(),

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
                            Row(
                              children: [
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK2', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK3', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK4', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK5', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${getTranslated('PROCESS_LEVEL_CHECK6', context)}",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff212121),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK7', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                  ),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK8', context)}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_LEVEL_CHECK9', context)}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff212121),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Container(
                        child: Column(
                          children: [
                            FutureBuilder(
                                future: Provider.of<ProcessProvider>(context,
                                        listen: false)
                                    .getProcess(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData == false) {
                                    return Column(
                                      children: [
                                        // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                                        SizedBox(
                                            height: Dimensions
                                                .PADDING_SIZE_OVER_LARGE),
                                        Center(
                                            child: CircularProgressIndicator()),
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Error: ${snapshot.error}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    );
                                  } else {
                                    setDatetime(snapshot.data);

                                    return Stepper(
                                      type: stepperType,
                                      physics: ScrollPhysics(),
                                      currentStep: _currentStep,
                                      onStepTapped: (step) => tapped(step),
                                      onStepContinue: continued,
                                      onStepCancel: cancel,
                                      controlsBuilder: (BuildContext context,
                                          ControlsDetails details) {
                                        return Container();
                                      },
                                      steps: <Step>[
                                        getStep(
                                            0,
                                            "${getTranslated('STEP0_TITLE', context)}",
                                            "${getTranslated('STEP0_CONTENTS1', context)}",
                                            "${getTranslated('STEP0_CONTENTS2', context)}",
                                            date0Text, () {
                                          tapped(0);
                                        }),
                                        getStep(
                                            1,
                                            "${getTranslated('STEP1_TITLE', context)}",
                                            "${getTranslated('STEP1_CONTENTS1', context)}",
                                            "${getTranslated('STEP1_CONTENTS2', context)}",
                                            date1Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessLoadingEstimatePage()));
                                        }),
                                        getStep(
                                            2,
                                            "${getTranslated('STEP2_TITLE', context)}",
                                            "${getTranslated('STEP2_CONTENTS1', context)}",
                                            "${getTranslated('STEP2_CONTENTS2', context)}",
                                            date2Text, () {
                                          _showDialog();
                                        }),
                                        getStep(
                                            3,
                                            "${getTranslated('STEP3_TITLE', context)}",
                                            "${getTranslated('STEP3_CONTENTS1', context)}",
                                            "${getTranslated('STEP3_CONTENTS2', context)}",
                                            date3Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessLoadingReceiveCarPage()));
                                        }),
                                        getStep(
                                            4,
                                            "${getTranslated('STEP4_TITLE', context)}",
                                            "${getTranslated('STEP4_CONTENTS1', context)}",
                                            "${getTranslated('STEP4_CONTENTS2', context)}",
                                            date4Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessLoadingCheckCarStatusPage()));
                                        }),
                                        getStep(
                                            5,
                                            "${getTranslated('STEP5_TITLE', context)}",
                                            "${getTranslated('STEP5_CONTENTS1', context)}",
                                            "${getTranslated('STEP5_CONTENTS2', context)}",
                                            date5Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessRealEstimatePage(
                                                          processModel:
                                                              _process)));
                                        }),
                                        getStep(
                                            6,
                                            "${getTranslated('STEP6_TITLE', context)}",
                                            "${getTranslated('STEP6_CONTENTS1', context)}",
                                            "${getTranslated('STEP6_CONTENTS2', context)}",
                                            date6Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessLoadingDisposalPage()));
                                        }),
                                        getStep(
                                            7,
                                            "${getTranslated('STEP7_TITLE', context)}",
                                            "${getTranslated('STEP7_CONTENTS1', context)}",
                                            "${getTranslated('STEP7_CONTENTS2', context)}",
                                            date7Text, () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyProcessCompletePage(
                                                        processModel: _process,
                                                      )));
                                        }),
                                      ],
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
                    "${getTranslated('REQUIRED_DOCUMENTS1', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Text(
                    "${getTranslated('REQUIRED_DOCUMENTS2', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Text(
                    "${getTranslated('REQUIRED_DOCUMENTS3', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text(
                    "${getTranslated('REQUIRED_DOCUMENTS4', context)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 12.0),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MyProcessTempEstimatePage(
                                processModel: _process,
                              )));
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
