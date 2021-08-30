import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx2/page4.dart';

class Page3 extends StatefulWidget {
  static final String TAG = '/page3';

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      // for history claim
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.toNamed(Page4.TAG);
          },
          color: Colors.blue,
          child: Text("Go to Page 4"),
        ),
      ),
    );
  }
}
