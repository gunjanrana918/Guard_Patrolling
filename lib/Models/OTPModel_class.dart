// To parse this JSON data, do
//
//     final otPvalidation = otPvalidationFromJson(jsonString);

import 'dart:convert';

OtPvalidation otPvalidationFromJson(String str) => OtPvalidation.fromJson(json.decode(str));

String otPvalidationToJson(OtPvalidation data) => json.encode(data.toJson());

class OtPvalidation {
  List<Login> login;

  OtPvalidation({
    required this.login,
  });

  factory OtPvalidation.fromJson(Map<String, dynamic> json) => OtPvalidation(
    login: List<Login>.from(json["Login"].map((x) => Login.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Login": List<dynamic>.from(login.map((x) => x.toJson())),
  };
}

class Login {
  bool error;
  String msg;
  dynamic gid;
  dynamic name;
  dynamic phoneNo;
  dynamic eMail;
  dynamic address;
  String loginId;
  dynamic sid;
  dynamic photo;
  dynamic sName;
  dynamic state;
  dynamic picode;

  Login({
    required this.error,
    required this.msg,
    this.gid,
    this.name,
    this.phoneNo,
    this.eMail,
    this.address,
    required this.loginId,
    this.sid,
    this.photo,
    this.sName,
    this.state,
    this.picode,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    error: json["error"],
    msg: json["msg"],
    gid: json["GID"],
    name: json["Name"],
    phoneNo: json["PhoneNo"],
    eMail: json["EMail"],
    address: json["Address"],
    loginId: json["LoginID"],
    sid: json["SID"],
    photo: json["Photo"],
    sName: json["SName"],
    state: json["State"],
    picode: json["Picode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "GID": gid,
    "Name": name,
    "PhoneNo": phoneNo,
    "EMail": eMail,
    "Address": address,
    "LoginID": loginId,
    "SID": sid,
    "Photo": photo,
    "SName": sName,
    "State": state,
    "Picode": picode,
  };
}
