import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:belajargetx2/chart.dart' as charts;

class ChartClaim extends StatefulWidget {
  const ChartClaim({Key key}) : super(key: key);

  @override
  _ChartClaimState createState() => _ChartClaimState();
}

class _ChartClaimState extends State<ChartClaim> {
  List<ClaimData> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<ClaimData>.from(data.map((i) => ClaimData.fromMap(i))).toList();
  }

  List<ClaimData> claimdata = [];
  Future<List<ClaimData>> getdata() async {
    List<ClaimData> list = [];
    final response =
        await http.get(Uri.parse("http://192.168.43.57/connectdb/chart.php"));
    if (response.statusCode == 200) {
      list = fromJson(response.body);
    }
    return list;
  }

  // static List<charts<ClaimData, String>> chartData(){
  //   return [charts.Series<ClaimData, String> (
  //     tglpengajuan:''
  //   )]
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ClaimData {
  final String tglpengajuan;
  final String typeclaim;

  ClaimData({this.tglpengajuan, this.typeclaim});

  factory ClaimData.fromMap(Map<String, dynamic> map) {
    return ClaimData(
        tglpengajuan: map["tglpengajuan"], typeclaim: map["typeclaim"]);
  }
}
