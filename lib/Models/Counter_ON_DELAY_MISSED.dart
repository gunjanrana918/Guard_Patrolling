// To parse this JSON data, do
//
//     final countTimeData = countTimeDataFromJson(jsonString);

import 'dart:convert';

CountTimeData countTimeDataFromJson(String str) => CountTimeData.fromJson(json.decode(str));

String countTimeDataToJson(CountTimeData data) => json.encode(data.toJson());

class CountTimeData {
  CountTimeData({
    required this.count,
  });

  List<Count> count;

  factory CountTimeData.fromJson(Map<String, dynamic> json) => CountTimeData(
    count: List<Count>.from(json["Count"].map((x) => Count.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Count": List<dynamic>.from(count.map((x) => x.toJson())),
  };
}

class Count {
  Count({
    required this.error,
    required this.msg,
    required this.onTime,
    required this.dealyCount,
    required this.missedCount,
  });

  bool error;
  String msg;
  String onTime;
  String dealyCount;
  String missedCount;

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    error: json["error"],
    msg: json["msg"],
    onTime: json["OnTime"],
    dealyCount: json["DealyCount"],
    missedCount: json["MissedCount"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "OnTime": onTime,
    "DealyCount": dealyCount,
    "MissedCount": missedCount,
  };
}
