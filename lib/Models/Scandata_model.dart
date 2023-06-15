// To parse this JSON data, do
//
//     final scandata = scandataFromJson(jsonString);

import 'dart:convert';

Scandata scandataFromJson(String str) => Scandata.fromJson(json.decode(str));

String scandataToJson(Scandata data) => json.encode(data.toJson());

class Scandata {
  QrcodeTable qrcodeTable;

  Scandata({
    required this.qrcodeTable,
  });

  factory Scandata.fromJson(Map<String, dynamic> json) => Scandata(
    qrcodeTable: QrcodeTable.fromJson(json["qrcodeTable"]),
  );

  Map<String, dynamic> toJson() => {
    "qrcodeTable": qrcodeTable.toJson(),
  };
}

class QrcodeTable {
  bool error;
  String msg;
  String qrName;
  String qrAddress;
  String qrLatitude;
  String qrLongitude;
  String qrDate;
  String locationCode;
  String locationName;
  String scheduleId;
  String scheduleTime;
  String shift;
  List<CheckPoitTable> checkPoitTable;

  QrcodeTable({
    required this.error,
    required this.msg,
    required this.qrName,
    required this.qrAddress,
    required this.qrLatitude,
    required this.qrLongitude,
    required this.qrDate,
    required this.locationCode,
    required this.locationName,
    required this.scheduleId,
    required this.scheduleTime,
    required this.shift,
    required this.checkPoitTable,
  });

  factory QrcodeTable.fromJson(Map<String, dynamic> json) => QrcodeTable(
    error: json["error"],
    msg: json["msg"],
    qrName: json["QRName"],
    qrAddress: json["QRAddress"],
    qrLatitude: json["QRLatitude"],
    qrLongitude: json["QRLongitude"],
    qrDate: json["QRDate"],
    locationCode: json["LocationCode"],
    locationName: json["LocationName"],
    scheduleId: json["ScheduleID"],
    scheduleTime: json["ScheduleTime"],
    shift: json["Shift"],
    checkPoitTable: List<CheckPoitTable>.from(json["CheckPoitTable"].map((x) => CheckPoitTable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "QRName": qrName,
    "QRAddress": qrAddress,
    "QRLatitude": qrLatitude,
    "QRLongitude": qrLongitude,
    "QRDate": qrDate,
    "LocationCode": locationCode,
    "LocationName": locationName,
    "ScheduleID": scheduleId,
    "ScheduleTime": scheduleTime,
    "Shift": shift,
    "CheckPoitTable": List<dynamic>.from(checkPoitTable.map((x) => x.toJson())),
  };
}

class CheckPoitTable {
  String checkPointId;
  String checkPointName;

  CheckPoitTable({
    required this.checkPointId,
    required this.checkPointName,
  });

  factory CheckPoitTable.fromJson(Map<String, dynamic> json) => CheckPoitTable(
    checkPointId: json["CheckPointID"],
    checkPointName: json["checkPointName"],
  );

  Map<String, dynamic> toJson() => {
    "CheckPointID": checkPointId,
    "checkPointName": checkPointName,
  };
}
