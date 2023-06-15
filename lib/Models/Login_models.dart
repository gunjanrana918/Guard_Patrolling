// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  List<Login> login;

  Userdata({
    required this.login,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    login: List<Login>.from(json["Login"].map((x) => Login.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Login": List<dynamic>.from(login.map((x) => x.toJson())),
  };
}

class Login {
  bool error;
  String msg;
  String gid;
  String name;
  String phoneNo;
  String eMail;
  String address;
  String loginId;
  String sid;
  String photo;
  String sName;
  String state;
  String picode;
  String reportingMgrName;
  String reportingMgrContact;
  String reportingMgrEmail;
  String userType;

  Login({
    required this.error,
    required this.msg,
    required this.gid,
    required this.name,
    required this.phoneNo,
    required this.eMail,
    required this.address,
    required this.loginId,
    required this.sid,
    required this.photo,
    required this.sName,
    required this.state,
    required this.picode,
    required this.reportingMgrName,
    required this.reportingMgrContact,
    required this.reportingMgrEmail,
    required this.userType,
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
    reportingMgrName: json["ReportingMgrName"],
    reportingMgrContact: json["ReportingMgrContact"],
    reportingMgrEmail: json["ReportingMgrEmail"],
    userType: json["UserType"],
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
    "ReportingMgrName": reportingMgrName,
    "ReportingMgrContact": reportingMgrContact,
    "ReportingMgrEmail": reportingMgrEmail,
    "UserType": userType,
  };
}
