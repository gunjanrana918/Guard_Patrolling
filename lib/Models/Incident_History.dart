// To parse this JSON data, do
//
//     final incidentHistory = incidentHistoryFromJson(jsonString);

import 'dart:convert';

IncidentHistory incidentHistoryFromJson(String str) => IncidentHistory.fromJson(json.decode(str));

String incidentHistoryToJson(IncidentHistory data) => json.encode(data.toJson());

class IncidentHistory {
  List<Datum> data;

  IncidentHistory({
    required this.data,
  });

  factory IncidentHistory.fromJson(Map<String, dynamic> json) => IncidentHistory(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  bool error;
  String msg;
  String incidentId;
  String subLocation;
  String date;
  String time;
  String gidName;
  String locationName;
  String incidentDetails;
  String photoUrl;
  String latitude;
  String longitude;

  Datum({
    required this.error,
    required this.msg,
    required this.incidentId,
    required this.subLocation,
    required this.date,
    required this.time,
    required this.gidName,
    required this.locationName,
    required this.incidentDetails,
    required this.photoUrl,
    required this.latitude,
    required this.longitude,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    error: json["error"],
    msg: json["msg"],
    incidentId: json["IncidentID"],
    subLocation: json["SubLocation"],
    date: json["Date"],
    time: json["Time"],
    gidName: json["GIDName"],
    locationName: json["LocationName"],
    incidentDetails: json["IncidentDetails"],
    photoUrl: json["PhotoUrl"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "IncidentID": incidentId,
    "SubLocation": subLocation,
    "Date": date,
    "Time": time,
    "GIDName": gidName,
    "LocationName": locationName,
    "IncidentDetails": incidentDetails,
    "PhotoUrl": photoUrl,
    "Latitude": latitude,
    "Longitude": longitude,
  };
}
