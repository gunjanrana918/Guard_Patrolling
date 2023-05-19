import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Locationdata {
  late String _mySelection;
  late List data;

  Future<String> Getdata() async {
    var res = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/Location'));
    var resBody = json.decode(res.body);
    data = resBody;
    return 'Success';
  }

   DropDown(List data){
    if(data!=null){
      return  DropdownButton(
        items: data.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item['Name'],
              style: TextStyle(fontSize: 14.0),
            ),
            value: item['ID'].toString(),
          );
        }).toList(),
        hint: Text(
          "Please Select Location",
          style: TextStyle(
            color: Colors.black45,
          ),),
        onChanged: (newVal) {
            _mySelection = newVal!;
            print('customrid:' + _mySelection);
        },
        value: _mySelection,
      );


    }
    else{
      return new Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

