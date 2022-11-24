// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pcgo/provider/car_provider.dart';
import 'package:pcgo/provider/clients_provider.dart';
import 'package:pcgo/provider/process_provider.dart';
import 'package:pcgo/provider/request_provider.dart';
import 'package:pcgo/provider/review_provider.dart';
import 'package:pcgo/provider/localization_provider.dart';
import 'package:pcgo/provider/onboarding_provider.dart';
import 'package:pcgo/provider/splash_provider.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/theme/dark_theme.dart';
import 'package:pcgo/theme/light_theme.dart';
import 'package:pcgo/utill/app_constants.dart';
import 'package:pcgo/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'helper/custom_delegate.dart';
import 'localization/app_localization.dart';
import 'provider/banner_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await di.init();
  int _orderID;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<BannerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ClientsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProcessProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RequestProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ReviewProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CarProvider>()),
    ],
    child: MyApp(orderId: _orderID),
  ));
}

class MyApp extends StatelessWidget {
  final int orderId;
  MyApp({@required this.orderId});

  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstants.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate()
      ],
      supportedLocales: _locals,
      home: SplashScreen(),
    );
  }
}
