
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:guard_patrolling/universaldata.dart';

import '../Models/Scandata_model.dart';

class Fetchscanreport extends GetxController{
  var isDataloading = true.obs;
  List<Scandata> list = [];
  String latitudedata = "";
  String longitudedata = "";
String? ScanMessage;
  var globalshift;



  getCurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
      latitudedata = '${geoposition.latitude}';
      print("latitudedata1");
      print(latitudedata);
      longitudedata = '${geoposition.longitude}';
      print("longitude2");
      print(longitudedata);

  }

   Scandetails() async {
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/qrcode'));
    request.body = json.encode({
      "qrid": globaldata.scanid,
      "DLatitude": globaldata.Dlattitude,
      "DLongitude": globaldata.Dlongitude
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    try {
      if(response.statusCode == 200){
        print("*****");
        print(responseData);
        var scaninfo = Scandata.fromJson(jsonDecode(responseData));
        var scanmessage = scaninfo.qrcodeTable.msg;
        ScanMessage = scanmessage;
        globaldata.Scanmessage = scaninfo.qrcodeTable.msg;
        globaldata.Schelduleid = scaninfo.qrcodeTable.scheduleId;
        globaldata.Scheduleshift = scaninfo.qrcodeTable.shift;
        print(globaldata.Schelduleid);
        print(globaldata.Scheduleshift);
        if(globaldata.Scheduleshift=='DAY'){
          globalshift="1";
        }
        else{
          globalshift="2";
        }
        print("Response");
        print(globaldata.Scanmessage);
        Fluttertoast.showToast(
            msg:  ScanMessage.toString() ,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            timeInSecForIosWeb: 5,
            backgroundColor: Color(0xFF184f8d),
            textColor: Colors.white,
            fontSize: 16.0);
        print("ScanInfo");
        print(scaninfo);
        return scaninfo;
      }
      else{
        Fluttertoast.showToast(
            msg:   "QRLat & Long dont match with Device Lat & Long!" ,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            backgroundColor: Color(0xFF184f8d),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    catch(e){
      print("error");

    }

  }
}
