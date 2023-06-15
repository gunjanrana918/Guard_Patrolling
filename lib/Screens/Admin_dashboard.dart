import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guard_patrolling/Controllers/FetchScan_Report.dart';
import 'package:guard_patrolling/Controllers/Login_controller.dart';
import 'package:guard_patrolling/Models/Login_models.dart';
import 'package:guard_patrolling/Screens/Adminsearch_Guardhistory.dart';
import 'package:guard_patrolling/Screens/Adminsearch_Incident.dart';
import 'package:guard_patrolling/Screens/Change_password.dart';
import 'package:guard_patrolling/Screens/Guard_HistorySearch.dart';
import 'package:guard_patrolling/Screens/Incident_screen.dart';
import 'package:guard_patrolling/Screens/Incident_search.dart';
import 'package:guard_patrolling/Screens/Profile_menu.dart';
import 'package:guard_patrolling/Screens/login.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  final Logincontroller obj = Get.put(Logincontroller());
  final Fetchscanreport fetchdata = Get.put(Fetchscanreport());
  Userdata? fromdata;
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => Container(
        height: 100,
        child: AlertDialog(
          title: Text('Do you want to exit?'),
          actions: <Widget>[
            // ignore: deprecated_member_use
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            // ignore: deprecated_member_use
            ElevatedButton(
              onPressed: () => exit(0),
              child: const Text('Yes'),
            ),
          ],
        ),
      ),
    )) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(globaldata.Name),
          backgroundColor: const Color(0xFF184f8d),
        ),
          drawer: Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              globaldata.Name,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            accountEmail: const Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
              NetworkImage(
                  "https://cdn.icon-icons.com/icons2/1378/PNG/512/"
                      "avatardefault_92824.png"),
            ),
            decoration: BoxDecoration(color: Colors.transparent),
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black)),
            elevation: 4.0,
            child: ListTile(
                dense: true,
                leading: Icon(Icons.person,size: 35,color: Colors.blueAccent,),
                title: const Text(
                  'My Profile',
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profilemenu(fromdata: fromdata,)));
                }),
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black)),
            child: ListTile(
                dense: true,
                leading: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xFF447cf4),
                ),
                title: const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => changepassword()));
                }),
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black)),
            child: ListTile(
                dense: true,
                leading: const Icon(
                  Icons.contact_support_sharp,
                  size: 30.0,
                  color: Color(0xFF447cf4),
                ),
                title: const Text(
                  'Contact Security Incharge',
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => resetpassword()));
                }),
          ),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black)),
            child: ListTile(
                dense: true,
                leading: const Icon(
                  Icons.logout,
                  size: 30.0,
                  color: Color(0xFF447cf4),
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: () async{
                  SharedPreferences preferences =
                  await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginscreen()));
                }),
          ),
        ],
      ),
    ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 70,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Incidentrecord()));
                    },
                    child: Text(
                      "Incident",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xFF184f8d), width: 1.5)),
                    elevation: 10.0,
                    textColor: Colors.black,
                  ),
                ),
                SizedBox(
                    width: 150,
                    height: 70,
                    child: MaterialButton(
                      onPressed: () {
                        _callNumber();
                      },
                      child: Text(
                        "SOS",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side:
                          BorderSide(color: Color(0xFF184f8d), width: 1.5)),
                      elevation: 10.0,
                      // color: Colors.green,
                      textColor: Colors.black,
                    )),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 70,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scanhistory()));
                    },
                    child: Text(
                      "Guard History",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xFF184f8d), width: 1.5)),
                    elevation: 10.0,
                    textColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 70,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => incidenthistory()));
                    },
                    child: Text(
                      "Incident History",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Color(0xFF184f8d), width: 1.5)),
                    elevation: 10.0,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ) );
  }
  _callNumber() async{
    const number = '09987559859'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
