import 'package:flutter/material.dart';

import 'package:pcgo/localization/language_constrants.dart';
import 'package:pcgo/provider/onboarding_provider.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/view/screen/home/home_screens.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  final Color indicatorColor;
  final Color selectedIndicatorColor;

  OnBoardingScreen({
    this.indicatorColor = Colors.grey,
    this.selectedIndicatorColor = Colors.black,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initBoardingList(context);

    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Provider.of<ThemeProvider>(context).darkTheme
              ? SizedBox()
              : SizedBox(),
          Consumer<OnBoardingProvider>(
            builder: (context, onBoardingList, child) => ListView(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(color: Color(0XFF2434D7)),
                  child: TextButton(
                    onPressed: () {
                      // 인트로 보이기
                      // Provider.of<SplashProvider>(context, listen: false).enableIntro();
                      // 인트로 숨기기
                      // Provider.of<SplashProvider>(context, listen: false).disableIntro();
                      // tabbar 대시보드
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoardScreen()));
                      // home 화면
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      width: 80,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text(getTranslated('NEXT', context),
                              style: titilliumSemiBold.copyWith(
                                  // color: Theme.of(context).primaryColor,
                                  color: Colors.white,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: _height,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFF2434D7),
                        ),
                        child: PageView.builder(
                          itemCount: onBoardingList.onBoardingList.length,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return index != 2
                                ? Column(
                                    children: [
                                      SizedBox(height: _height * 0.20),
                                      Image.asset(
                                          onBoardingList
                                              .onBoardingList[index].imageUrl,
                                          height: _height * 0.4),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(height: _height * 0.2),
                                      Container(
                                        width: double.infinity,
                                        // height: double.infinity,
                                        child: Image.asset(
                                            onBoardingList
                                                .onBoardingList[index].imageUrl,
                                            fit: BoxFit.fill),
                                      ),
                                    ],
                                  );
                          },
                          onPageChanged: (index) {
                            onBoardingList.changeSelectIndex(index);
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: _height * 0.80),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _pageIndicators(
                                onBoardingList.onBoardingList, context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _pageIndicators(var onBoardingList, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: i == Provider.of<OnBoardingProvider>(context).selectedIndex
              ? 18
              : 7,
          height: 7,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: i == Provider.of<OnBoardingProvider>(context).selectedIndex
                ? Theme.of(context).primaryColor
                : Colors.white,
            borderRadius:
                i == Provider.of<OnBoardingProvider>(context).selectedIndex
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return _indicators;
  }
}
