import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pcgo/localization/language_constrants.dart';
import 'package:pcgo/provider/splash_provider.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/images.dart';
import 'package:pcgo/view/screen/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import '../home/home_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool _firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected
                ? getTranslated('no_connection', context)
                : getTranslated('connected', context),
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      _firstTime = false;
    });

    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false)
        .initSharedPrefData();

    Provider.of<SplashProvider>(context, listen: false).enableIntro();

    Timer(Duration(seconds: 1), () {
      if (Provider.of<SplashProvider>(context, listen: false).showIntro()) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingScreen(
              indicatorColor: ColorResources.GREY,
              selectedIndicatorColor: Theme.of(context).primaryColor,
            )));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Provider.of<ThemeProvider>(context).darkTheme
                ? Colors.black
                : Color(0XFF2434D7),
            // child: CustomPaint(
            //   painter: SplashPainter(),
            // ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Images.splash_logo,
                  height: 250.0,
                  fit: BoxFit.scaleDown,
                  width: 250.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
