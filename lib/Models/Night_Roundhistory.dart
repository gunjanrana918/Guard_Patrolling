// To parse this JSON data, do
//
//     final nightHistory = nightHistoryFromJson(jsonString);

import 'dart:convert';

NightHistory nightHistoryFromJson(String str) => NightHistory.fromJson(json.decode(str));

String nightHistoryToJson(NightHistory data) => json.encode(data.toJson());

class NightHistory {
  NightHistory({
    required this.schedule,
  });

  List<Schedule> schedule;

  factory NightHistory.fromJson(Map<String, dynamic> json) => NightHistory(
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
    required this.locationName,
    required this.reportCheckPoint,
    required this.scheduleTime,
    required this.shift,
    required this.reportdate,
  });

  bool error;
  String msg;
  String locationName;
  String reportCheckPoint;
  String scheduleTime;
  String shift;
  String reportdate;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: json["msg"],
    locationName: json["LocationName"],
    reportCheckPoint: json["ReportCheckPoint"],
    scheduleTime: json["ScheduleTime"],
    shift: json["Shift"],
    reportdate: json["Reportdate"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "LocationName": locationName,
    "ReportCheckPoint": reportCheckPoint,
    "ScheduleTime": scheduleTime,
    "Shift": shift,
    "Reportdate": reportdate,
  };
}
