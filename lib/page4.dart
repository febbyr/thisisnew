import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page5.dart';

class Page4 extends StatefulWidget {
  static final String TAG = '/page4';

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 4"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.toNamed(Page5.TAG);
          },
          color: Colors.blue,
          child: Text("Go to Page 5"),
        ),
      ),
    );
  }
}
