import 'package:belajargetx2/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class RequestView extends StatelessWidget {
  const RequestView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("just fun"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                      title: Text("The list item #$index"),
                      subtitle: Text("The subtitle"),
                      leading: Icon(Icons.thumb_up),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage()));
                        },
                        icon: Icon(Icons.arrow_forward),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
