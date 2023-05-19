// To parse this JSON data, do
//
//     final checkpointModel = checkpointModelFromJson(jsonString);

import 'dart:convert';

CheckpointModel checkpointModelFromJson(String str) => CheckpointModel.fromJson(json.decode(str));

String checkpointModelToJson(CheckpointModel data) => json.encode(data.toJson());

class CheckpointModel {
  CheckpointModel({
    required this.checkpoint,
  });

  List<Checkpoint> checkpoint;

  factory CheckpointModel.fromJson(Map<String, dynamic> json) => CheckpointModel(
    checkpoint: List<Checkpoint>.from(json["Checkpoint"].map((x) => Checkpoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Checkpoint": List<dynamic>.from(checkpoint.map((x) => x.toJson())),
  };
}

class Checkpoint {
  Checkpoint({
    required this.error,
    required this.msg,
    required this.checkId,
    required this.checkPointName,
    required this.checkPointMsg,
    required this.gid,
    required this.locationName,
  });

  bool error;
  String msg;
  String checkId;
  String checkPointName;
  String checkPointMsg;
  String gid;
  String locationName;

  factory Checkpoint.fromJson(Map<String, dynamic> json) => Checkpoint(
    error: json["error"],
    msg: json["msg"],
    checkId: json["CheckID"],
    checkPointName: json["CheckPointName"],
    checkPointMsg: json["CheckPointMsg"],
    gid: json["GID"],
    locationName: json["LocationName"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "CheckID": checkId,
    "CheckPointName": checkPointName,
    "CheckPointMsg": checkPointMsg,
    "GID": gid,
    "LocationName": locationName,
  };
}
