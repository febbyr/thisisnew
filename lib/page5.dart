import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajargetx2/page2.dart';
import 'package:belajargetx2/page1.dart';

class Page5 extends StatefulWidget {
  static final String TAG = '/page5';

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 5"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Get.offNamedUntil(Page2.TAG, ModalRoute.withName(Page1.TAG));
          },
          color: Colors.blue,
          child: Text("Go to Page 2"),
        ),
      ),
    );
  }
}
