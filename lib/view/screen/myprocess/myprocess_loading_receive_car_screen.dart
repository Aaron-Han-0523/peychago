import 'package:flutter/material.dart';

import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class MyProcessLoadingReceiveCarPage extends StatefulWidget {
  @override
  State<MyProcessLoadingReceiveCarPage> createState() => _MyProcessLoadingReceiveCarPageState();
}

class _MyProcessLoadingReceiveCarPageState extends State<MyProcessLoadingReceiveCarPage>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('LOADING_RECEIVE_CAR', context)}",).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.loading_receive_car,
                        // height: 35,
                      ),
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
