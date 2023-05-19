// To parse this JSON data, do
//
//     final totalRound = totalRoundFromJson(jsonString);

import 'dart:convert';

TotalRound totalRoundFromJson(String str) => TotalRound.fromJson(json.decode(str));

String totalRoundToJson(TotalRound data) => json.encode(data.toJson());

class TotalRound {
    TotalRound({
        required this.count,
    });

    List<Count> count;

    factory TotalRound.fromJson(Map<String, dynamic> json) => TotalRound(
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
        required this.dayCount,
        required this.nightCount,
        required this.totalCount,
    });

    bool error;
    String msg;
    String dayCount;
    String nightCount;
    String totalCount;

    factory Count.fromJson(Map<String, dynamic> json) => Count(
        error: json["error"],
        msg: json["msg"],
        dayCount: json["DayCount"],
        nightCount: json["NightCount"],
        totalCount: json["TotalCount"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "DayCount": dayCount,
        "NightCount": nightCount,
        "TotalCount": totalCount,
    };
}
