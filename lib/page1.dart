import 'package:belajargetx2/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  static final String TAG = '/page1';

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),

      // berisi status claim karyawan
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.toNamed(Page2.TAG);
          },
          color: Colors.blue,
          child: Text("Go to Page 2"),
        ),
      ),
    );
  }
}
