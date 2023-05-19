// To parse this JSON data, do
//
//     final nextRound = nextRoundFromJson(jsonString);

import 'dart:convert';

NextRound nextRoundFromJson(String str) => NextRound.fromJson(json.decode(str));

String nextRoundToJson(NextRound data) => json.encode(data.toJson());

class NextRound {
  NextRound({
    required this.schedule,
  });

  List<Schedule> schedule;

  factory NextRound.fromJson(Map<String, dynamic> json) => NextRound(
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
  });

  bool error;
  String msg;
  String scheduleId;
  String locationName;
  String checkPointName;
  String scheduleTime;
  String shift;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: json["msg"],
    scheduleId: json["ScheduleID"],
    locationName: json["LocationName"],
    checkPointName: json["CheckPointName"],
    scheduleTime: json["ScheduleTime"],
    shift: json["Shift"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "ScheduleID": scheduleId,
    "LocationName": locationName,
    "CheckPointName": checkPointName,
    "ScheduleTime": scheduleTime,
    "Shift": shift,
  };
}
