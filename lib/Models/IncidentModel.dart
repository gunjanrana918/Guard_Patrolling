// To parse this JSON data, do
//
//     final incidentReport = incidentReportFromJson(jsonString);

import 'dart:convert';

IncidentReport incidentReportFromJson(String str) => IncidentReport.fromJson(json.decode(str));

String incidentReportToJson(IncidentReport data) => json.encode(data.toJson());

class IncidentReport {
  IncidentReport({
    required this.incidentTable,
  });

  List<IncidentTable> incidentTable;

  factory IncidentReport.fromJson(Map<String, dynamic> json) => IncidentReport(
    incidentTable: List<IncidentTable>.from(json["IncidentTable"].map((x) => IncidentTable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "IncidentTable": List<dynamic>.from(incidentTable.map((x) => x.toJson())),
  };
}

class IncidentTable {
  IncidentTable({
    required this.error,
    required this.msg,
  });

  bool error;
  String msg;

  factory IncidentTable.fromJson(Map<String, dynamic> json) => IncidentTable(
    error: json["error"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
  };
}
