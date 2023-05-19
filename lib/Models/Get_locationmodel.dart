// To parse this JSON data, do
//
//     final getLocation = getLocationFromJson(jsonString);

import 'dart:convert';

GetLocation getLocationFromJson(String str) => GetLocation.fromJson(json.decode(str));

String getLocationToJson(GetLocation data) => json.encode(data.toJson());

class GetLocation {
  GetLocation({
    required this.location,
  });

  List<Location> location;

  factory GetLocation.fromJson(Map<String, dynamic> json) => GetLocation(
    location: List<Location>.from(json["Location"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Location": List<dynamic>.from(location.map((x) => x.toJson())),
  };
}

class Location {
  Location({
    required this.error,
    required this.msg,
    required this.locationId,
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  bool error;
  Msg msg;
  String locationId;
  String locationName;
  String latitude;
  String longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    error: json["error"],
    msg: msgValues.map[json["msg"]]!,
    locationId: json["LocationID"],
    locationName: json["LocationName"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msgValues.reverse[msg],
    "LocationID": locationId,
    "LocationName": locationName,
    "Latitude": latitude,
    "Longitude": longitude,
  };
}

enum Msg { SUCCESSFULLY }

final msgValues = EnumValues({
  "Successfully": Msg.SUCCESSFULLY
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
