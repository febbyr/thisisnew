import 'package:belajargetx2/splash_screen.dart';
import 'package:get/get.dart';
import 'package:belajargetx2/page1.dart';

import '../page2.dart';
import '../page3.dart';
import '../page4.dart';
import '../page5.dart';

List<GetPage> get getRoutePages => _routePages;

List<GetPage> _routePages = [
  GetPage(name: SplashScreen.TAG, page: () => SplashScreen()),
  GetPage(name: Page1.TAG, page: () => Page1()),
  GetPage(name: Page2.TAG, page: () => Page2()),
  GetPage(name: Page3.TAG, page: () => Page3()),
  GetPage(name: Page4.TAG, page: () => Page4()),
  GetPage(name: Page5.TAG, page: () => Page5()),
];
