// To parse this JSON data, do
//
//     final sendQrReport = sendQrReportFromJson(jsonString);

import 'dart:convert';

SendQrReport sendQrReportFromJson(String str) => SendQrReport.fromJson(json.decode(str));

String sendQrReportToJson(SendQrReport data) => json.encode(data.toJson());

class SendQrReport {
  SendQrReport({
    required this.scanreportTable,
  });

  List<ScanreportTable> scanreportTable;

  factory SendQrReport.fromJson(Map<String, dynamic> json) => SendQrReport(
    scanreportTable: List<ScanreportTable>.from(json["ScanreportTable"].map((x) => ScanreportTable.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ScanreportTable": List<dynamic>.from(scanreportTable.map((x) => x.toJson())),
  };
}

class ScanreportTable {
  ScanreportTable({
    required this.error,
    required this.msg,
  });

  bool error;
  String msg;

  factory ScanreportTable.fromJson(Map<String, dynamic> json) => ScanreportTable(
    error: json["error"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
  };
}
