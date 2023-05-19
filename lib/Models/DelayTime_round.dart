// To parse this JSON data, do
//
//     final delayround = delayroundFromJson(jsonString);

import 'dart:convert';

Delayround delayroundFromJson(String str) => Delayround.fromJson(json.decode(str));

String delayroundToJson(Delayround data) => json.encode(data.toJson());

class Delayround {
  Delayround({
    required this.schedule,
  });

  List<Schedule> schedule;

  factory Delayround.fromJson(Map<String, dynamic> json) => Delayround(
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
    this.scheduleId,
    this.locationName,
    this.checkPointName,
    this.scheduleTime,
    this.shift,
    this.cTime,
  });

  bool error;
  String msg;
  dynamic scheduleId;
  dynamic locationName;
  dynamic checkPointName;
  dynamic scheduleTime;
  dynamic shift;
  dynamic cTime;

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
