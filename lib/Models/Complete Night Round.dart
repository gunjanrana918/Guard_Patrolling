// To parse this JSON data, do
//
//     final completeNightRound = completeNightRoundFromJson(jsonString);

import 'dart:convert';

CompleteNightRound completeNightRoundFromJson(String str) => CompleteNightRound.fromJson(json.decode(str));

String completeNightRoundToJson(CompleteNightRound data) => json.encode(data.toJson());

class CompleteNightRound {
  List<Schedule> schedule;

  CompleteNightRound({
    required this.schedule,
  });

  factory CompleteNightRound.fromJson(Map<String, dynamic> json) => CompleteNightRound(
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
