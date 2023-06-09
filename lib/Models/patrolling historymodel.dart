// To parse this JSON data, do
//
//     final guardhistory = guardhistoryFromJson(jsonString);

import 'dart:convert';

Guardhistory guardhistoryFromJson(String str) => Guardhistory.fromJson(json.decode(str));

String guardhistoryToJson(Guardhistory data) => json.encode(data.toJson());

class Guardhistory {
  List<Schedule> schedule;

  Guardhistory({
    required this.schedule,
  });

  factory Guardhistory.fromJson(Map<String, dynamic> json) => Guardhistory(
    schedule: List<Schedule>.from(json["Schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule {
  bool error;
  String msg;
  String scheduleId;
  String scheduleToDate;
  String shift;
  String scheduleName;
  String checkPointName;
  String scheduleTime;
  String locationName;
  String completeTime;
  String reportdate;
  String status;

  Schedule({
    required this.error,
    required this.msg,
    required this.scheduleId,
    required this.scheduleToDate,
    required this.shift,
    required this.scheduleName,
    required this.checkPointName,
    required this.scheduleTime,
    required this.locationName,
    required this.completeTime,
    required this.reportdate,
    required this.status,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: json["msg"],
    scheduleId: json["ScheduleID"],
    scheduleToDate: json["ScheduleToDate"],
    shift: json["Shift"],
    scheduleName: json["ScheduleName"],
    checkPointName: json["checkPointName"],
    scheduleTime: json["ScheduleTime"],
    locationName: json["LocationName"],
    completeTime: json["CompleteTime"],
    reportdate: json["Reportdate"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "ScheduleID": scheduleId,
    "ScheduleToDate": scheduleToDate,
    "Shift": shift,
    "ScheduleName": scheduleName,
    "checkPointName": checkPointName,
    "ScheduleTime": scheduleTime,
    "LocationName": locationName,
    "CompleteTime": completeTime,
    "Reportdate": reportdate,
    "status": status,
  };
}
