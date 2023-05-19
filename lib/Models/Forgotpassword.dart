// To parse this JSON data, do
//
//     final resetpassword = resetpasswordFromJson(jsonString);

import 'dart:convert';

Resetpassword resetpasswordFromJson(String str) => Resetpassword.fromJson(json.decode(str));

String resetpasswordToJson(Resetpassword data) => json.encode(data.toJson());

class Resetpassword {
  Resetpassword({
    required this.resetpwd,
  });

  List<Resetpwd> resetpwd;

  factory Resetpassword.fromJson(Map<String, dynamic> json) => Resetpassword(
    resetpwd: List<Resetpwd>.from(json["Resetpwd"].map((x) => Resetpwd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Resetpwd": List<dynamic>.from(resetpwd.map((x) => x.toJson())),
  };
}

class Resetpwd {
  Resetpwd({
    required this.error,
    required this.msg,
  });

  bool error;
  String msg;

  factory Resetpwd.fromJson(Map<String, dynamic> json) => Resetpwd(
    error: json["error"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
  };
}
