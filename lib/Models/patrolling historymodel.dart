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
  String uncheckPointName;
  String scheduleTime;
  String locationName;
  String completeTime;
  String reportdate;
  String status;
  String reportDescription;
  String photoUrl;
  String name;

  Schedule({
    required this.error,
    required this.msg,
    required this.scheduleId,
    required this.scheduleToDate,
    required this.shift,
    required this.scheduleName,
    required this.checkPointName,
    required this.uncheckPointName,
    required this.scheduleTime,
    required this.locationName,
    required this.completeTime,
    required this.reportdate,
    required this.status,
    required this.reportDescription,
    required this.photoUrl,
    required this.name,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: json["msg"]!,
    scheduleId: json["ScheduleID"],
    scheduleToDate: json["ScheduleToDate"]!,
    shift: json["Shift"]!,
    scheduleName: json["ScheduleName"]!,
    checkPointName: json["checkPointName"],
    uncheckPointName: json["UncheckPointName"],
    scheduleTime: json["ScheduleTime"]!,
    locationName: json["LocationName"],
    completeTime: json["CompleteTime"],
    reportdate: json["Reportdate"],
    status: json["status"]!,
    reportDescription: json["ReportDescription"],
    photoUrl: json["PhotoUrl"],
    name: json["Name"]!,
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "ScheduleID": scheduleId,
    "ScheduleToDate": scheduleToDate,
    "Shift": shift,
    "ScheduleName":scheduleName,
    "checkPointName": checkPointName,
    "UncheckPointName": uncheckPointName,
    "ScheduleTime": scheduleTime,
    "LocationName": locationName,
    "CompleteTime": completeTime,
    "Reportdate": reportdate,
    "status": status,
    "ReportDescription": reportDescription,
    "PhotoUrl": photoUrl,
    "Name": name,
  };
}


