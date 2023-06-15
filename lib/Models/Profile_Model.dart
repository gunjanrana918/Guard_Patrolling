// To parse this JSON data, do
//
//     final profilemodel = profilemodelFromJson(jsonString);

import 'dart:convert';

Profilemodel profilemodelFromJson(String str) => Profilemodel.fromJson(json.decode(str));

String profilemodelToJson(Profilemodel data) => json.encode(data.toJson());

class Profilemodel {
  List<Login> login;

  Profilemodel({
    required this.login,
  });

  factory Profilemodel.fromJson(Map<String, dynamic> json) => Profilemodel(
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

  Login({
    required this.error,
    required this.msg,
    required this.gid,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    error: json["error"],
    msg: json["msg"],
    gid: json["GID"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "GID": gid,
  };
}
