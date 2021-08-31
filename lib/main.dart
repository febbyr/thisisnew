import 'package:belajargetx2/request_view.dart';
import 'package:belajargetx2/routes/router.dart';
import 'package:belajargetx2/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:belajargetx2/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: RequestView(),
      // getPages: getRoutePages,
      // initialRoute: SplashScreen.TAG,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
