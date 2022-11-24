import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcgo/provider/process_provider.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';
import 'package:pcgo/view/screen/review/review_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/clients_model.dart';
import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/clients_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../home/home_screens.dart';

class ReviewLoginPage extends StatefulWidget {
  @override
  State<ReviewLoginPage> createState() => _ReviewLoginPageState();
}

class _ReviewLoginPageState extends State<ReviewLoginPage>
    with TickerProviderStateMixin {
  TextEditingController carNumTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('REVIEW', context)}").getAppbar(),

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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                Text(
                                  "${getTranslated('PROCESS_STATE_CHECK', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${getTranslated('PROCESS_STATE_CHECK2', context)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff212121),
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${getTranslated('MEMBER_INPUT', context)}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff212121),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            Text(
                              "${getTranslated('PHONE_NUMBER', context)}",
                              textAlign: TextAlign.start,
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
                                controller: phoneNumberTextEditingController,
                                hintText: "${getTranslated('PHONE_NUMBER_HINT_TEXT', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              "${getTranslated('PASSWORD', context)}",
                              textAlign: TextAlign.start,
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
                                controller: passwordTextEditingController,
                                hintText: "${getTranslated('PASSWORD_HINT_TEXT', context)}",
                                isBorder: true,
                                fillColor: Colors.white,
                                isPassword: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomElevatedButton(
                          onTap: () async {
                            ClientsModel clientsModel = ClientsModel(
                              phoneNum: phoneNumberTextEditingController.text,
                              password: passwordTextEditingController.text,
                            );

                            await Provider.of<ClientsProvider>(context,
                                    listen: false)
                                .login(clientsModel, route);
                          },
                          buttonText: "${getTranslated('LOGIN_TEXT', context)}",
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

  route(bool isRoute, String errorMessage) async {
    if (isRoute) {
      // 완료 상태 이면서 후기 없을 때 후기 작성
      // process state && review carNum
      await Provider.of<ProcessProvider>(context, listen: false).getProcess();
      int state =
          Provider.of<ProcessProvider>(context, listen: false).process.state;

      String reviewId =
          Provider.of<ProcessProvider>(context, listen: false).process.custom1;

      if (state >= 9 && reviewId == null) {
        ReviewModel reviewModel = ReviewModel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ReviewDetailPage(
              reviewModel: reviewModel,
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            // title: new Text("Dialog Title"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${getTranslated('REVIEW_NOTICE_TEXT', context)}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                  ),
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false);
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          // title: new Text("Dialog Title"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${getTranslated('LOGIN_FAIL', context)}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
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
                  return Navigator.pop(context);
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
}
