// To parse this JSON data, do
//
//     final missedround = missedroundFromJson(jsonString);

import 'dart:convert';

Missedround missedroundFromJson(String str) => Missedround.fromJson(json.decode(str));

String missedroundToJson(Missedround data) => json.encode(data.toJson());

class Missedround {
  List<Schedule> schedule;

  Missedround({
    required this.schedule,
  });

  factory Missedround.fromJson(Map<String, dynamic> json) => Missedround(
    schedule: List<Schedule>.from(json["Schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule {
  bool error;
  Msg msg;
  String scheduleId;
  String locationName;
  String checkPointName;
  String scheduleTime;
  Shift shift;
  String cTime;

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

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    error: json["error"],
    msg: msgValues.map[json["msg"]]!,
    scheduleId: json["ScheduleID"],
    locationName: json["LocationName"],
    checkPointName: json["CheckPointName"],
    scheduleTime: json["ScheduleTime"],
    shift: shiftValues.map[json["Shift"]]!,
    cTime: json["CTime"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msgValues.reverse[msg],
    "ScheduleID": scheduleId,
    "LocationName": locationName,
    "CheckPointName": checkPointName,
    "ScheduleTime": scheduleTime,
    "Shift": shiftValues.reverse[shift],
    "CTime": cTime,
  };
}

enum Msg { SUCCESSFULLY }

final msgValues = EnumValues({
  "Successfully": Msg.SUCCESSFULLY
});

enum Shift { DAY, NIGHT }

final shiftValues = EnumValues({
  "DAY": Shift.DAY,
  "NIGHT": Shift.NIGHT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
