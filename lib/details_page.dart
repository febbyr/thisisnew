import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Details Page"),
      ),
      body: Center(
        child: Text("The Detail page #$index"),
      ),
    );
  }
}
