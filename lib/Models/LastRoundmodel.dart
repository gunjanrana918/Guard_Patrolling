// To parse this JSON data, do
//
//     final lastRound = lastRoundFromJson(jsonString);

import 'dart:convert';

LastRound lastRoundFromJson(String str) => LastRound.fromJson(json.decode(str));

String lastRoundToJson(LastRound data) => json.encode(data.toJson());

class LastRound {
  LastRound({
    required this.schedule,
  });

  List<Schedule> schedule;

  factory LastRound.fromJson(Map<String, dynamic> json) => LastRound(
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
