// import 'package:belajargetx2/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:belajargetx2/model/request_model.dart';

class RequestView extends StatefulWidget {
  const RequestView({Key key}) : super(key: key);

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final Uri CARD_URL = Uri.parse("http://192.168.43.57/connectdb/getdata.php");
  List<RequestModel> requestview;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<List<RequestModel>> _fetchData() async {
    try {
      var jsonResponse = await http.get(CARD_URL);
      if (jsonResponse.statusCode == 200) {
        final jsonItems = json.decode(jsonResponse.body);

        requestview = jsonItems.map((json) {
          return RequestModel.fromJson(json);
        });
        return requestview;
      }
    } catch (e) {}
    return requestview;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_requestview) {
      setState(() => requestview = _requestview);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("just fun"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<RequestModel>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              margin: EdgeInsets.only(bottom: 0.0),
              child: ListView(
                padding: EdgeInsets.only(bottom: 160.0),
                children: snapshot.data
                    .map(
                      (_data) => Column(children: <Widget>[
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                  Icons.perm_media,
                                  size: 50,
                                ),
                                title: Text(_data.typeclaim),
                                subtitle: Text(_data.description
                                    // _data.tglpengajuan
                                    ),
                              )
                            ],
                          ),
                        )
                      ]),
                    )
                    .toList(),
              ),
            );
          },
        ),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: 20,
        //         itemBuilder: (_, index) {
        //           return Card(
        //             child: ListTile(
        //                 title: Text("The list item #$index"),
        //                 subtitle: Text("The subtitle"),
        //                 leading: Icon(Icons.thumb_up),
        //                 trailing: IconButton(
        //                   onPressed: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => DetailPage()));
        //                   },
        //                   icon: Icon(Icons.arrow_forward),
        //                 )),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
