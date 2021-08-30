import 'package:flutter/material.dart';
import 'package:belajargetx2/create_form.dart';
import 'package:get/get.dart';
import 'package:belajargetx2/page3.dart';

class Page2 extends StatefulWidget {
  static final String TAG = '/page2';

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    print("halaman 2 refresh");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input claim"),
      ),
      body: Column(
        children: [
          Column(
            children: [CreateForm()],
          ),
          RaisedButton(
            onPressed: () {
              Get.toNamed(Page3.TAG);
            },
            color: Colors.blue,
            child: Text("Go to Page 3"),
          ),
        ],
      ),
    );
  }
}
