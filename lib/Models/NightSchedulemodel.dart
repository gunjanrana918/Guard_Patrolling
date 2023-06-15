// To parse this JSON data, do
//
//     final nightRound = nightRoundFromJson(jsonString);

import 'dart:convert';

NightRound nightRoundFromJson(String str) => NightRound.fromJson(json.decode(str));

String nightRoundToJson(NightRound data) => json.encode(data.toJson());

class NightRound {
  List<Schedule> schedule;

  NightRound({
    required this.schedule,
  });

  factory NightRound.fromJson(Map<String, dynamic> json) => NightRound(
    schedule: List<Schedule>.from(json["Schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule {
  bool error;
  String msg;
  dynamic scheduleId;
  dynamic locationName;
  dynamic checkPointName;
  dynamic scheduleTime;
  dynamic shift;
  dynamic cTime;

  Schedule({
    required this.error,
    required this.msg,
    this.scheduleId,
    this.locationName,
    this.checkPointName,
    this.scheduleTime,
    this.shift,
    this.cTime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: json["msg"],
    scheduleId: json["ScheduleID"],
    locationName: json["LocationName"],
    checkPointName: json["CheckPointName"],
    scheduleTime: json["ScheduleTime"],
    shift: json["Shift"],
    cTime: json["CTime"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "ScheduleID": scheduleId,
    "LocationName": locationName,
    "CheckPointName": checkPointName,
    "ScheduleTime": scheduleTime,
    "Shift": shift,
    "CTime": cTime,
  };
}
