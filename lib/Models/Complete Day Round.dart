// To parse this JSON data, do
//
//     final completeDayRound = completeDayRoundFromJson(jsonString);

import 'dart:convert';

CompleteDayRound completeDayRoundFromJson(String str) => CompleteDayRound.fromJson(json.decode(str));

String completeDayRoundToJson(CompleteDayRound data) => json.encode(data.toJson());

class CompleteDayRound {
  CompleteDayRound({
    required this.schedule,
  });

  List<Schedule> schedule;

  factory CompleteDayRound.fromJson(Map<String, dynamic> json) => CompleteDayRound(
    schedule: List<Schedule>.from(json["Schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule {
  Schedule({
    required this.error,
    required this.msg,
    required this.scheduleId,
    required this.locationName,
    required this.checkPointName,
    required this.scheduleTime,
    required this.shift,
    required this.cTime,
  });

  bool error;
  String msg;
  String scheduleId;
  String locationName;
  String checkPointName;
  String scheduleTime;
  String shift;
  String cTime;

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
