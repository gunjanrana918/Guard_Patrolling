
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:guard_patrolling/Controllers/FetchScan_Report.dart';
import 'package:guard_patrolling/Controllers/Get_Location.dart';
import 'package:guard_patrolling/Controllers/Login_controller.dart';
import 'package:guard_patrolling/Models/Complete%20Day%20Round.dart';
import 'package:guard_patrolling/Models/Complete%20Night%20Round.dart';
import 'package:guard_patrolling/Models/DayHistory_Round.dart';
import 'package:guard_patrolling/Models/DaySchedulemodel.dart';
import 'package:guard_patrolling/Models/DelayTime_round.dart';
import 'package:guard_patrolling/Models/Missedtime_data.dart';
import 'package:guard_patrolling/Models/NextRound.dart';
import 'package:guard_patrolling/Models/NightSchedulemodel.dart';
import 'package:guard_patrolling/RoundHistory/Missedround_details.dart';
import 'package:guard_patrolling/Screens/Aboutspage.dart';
import 'package:guard_patrolling/Screens/Change_password.dart';
import 'package:guard_patrolling/Screens/HistoryTab.dart';
import 'package:guard_patrolling/Screens/Profile_menu.dart';
import 'package:guard_patrolling/Screens/Scanning_report.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Counter_ON_DELAY_MISSED.dart';
import '../Models/Get_locationmodel.dart';
import '../Models/LastRoundmodel.dart';
import '../Models/Login_models.dart';
import '../Models/Night_Roundhistory.dart';
import '../Models/OnTime_round.dart';
import '../Models/Scandata_model.dart';
import '../Models/Schedule.dart';
import '../Models/Total_CompleteCount.dart';
import '../RoundHistory/Complete_round.dart';
import '../RoundHistory/DelayTime_Rounddetails.dart';
import '../RoundHistory/Last_round.dart';
import '../RoundHistory/Ontime_round_details.dart';
import '../RoundHistory/Next_round.dart';
import 'Incident_screen.dart';
import '../RoundHistory/Today_round.dart';
import 'login.dart';

class Dashboardscreen extends StatefulWidget {
   Dashboardscreen( {Key? key,}) : super(key: key);
  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}
int index =0;
class _DashboardscreenState extends State<Dashboardscreen> {
  final Logincontroller obj = Get.put(Logincontroller());
  final Schedulecontroller data = Get.put(Schedulecontroller());
  final Completecontroller Cdata = Get.put(Completecontroller());
  final Lastroundcontroller lastrounddata = Get.put(Lastroundcontroller());
  final Nextroundcontroller Nextdata = Get.put(Nextroundcontroller());
  final Countercontroller mycounterdata = Get.put(Countercontroller());
  final Fetchscanreport fetchdata = Get.put(Fetchscanreport());
  final Historyroundcontroller object = Get.put(Historyroundcontroller());
  final NightRoundhistory nightvalue = Get.put(NightRoundhistory());
  final RoundDetails timedata = Get.put(RoundDetails());
  Scandata? scandata;
  Userdata? fromdata;
  NextRound? nextdata;
  LastRound? lastdata;
  GetLocation? alllocation;
  DayHistory? rounddata;
  NightHistory? nightnewdata;
  TotalRound? totalcount;
  DayRound? dayround;
  NightRound? nightround;
  CompleteTotalCount? comptotalcount;
  CompleteDayRound? CDAYROUND;
  CompleteNightRound? CNIGHTROUND;
  Ontimeround? ontimedata;
  Missedround? missrounddata;
  Delayround? delaytimedata;
  String?latitudedata ;
  String? longitudedata;
  var Newdata;
  late String scannedQrcode ;
  var todayroundvalue ="";
  var completeroundvalue ="";
  var lastroundlocation =""; var lastroundtime ="";
  var nextroundvisitname ="";   var nextroundvisittime ="";
  var ontimeroundvalue ="";
  var delayroundvalue ="";
  var missedroundvalue ="";
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  void _onLoading() async {
    // your api here
    data.Getschedule().then((value) {
      data.totalmessage;
      setState(() {
        todayroundvalue=data.totalmessage ?? " ";
      });
    });
    Cdata.CtotalRound().then((value) {
      Cdata.completemessage;
      setState(() {
        completeroundvalue = Cdata.completemessage;
      });
    });
    lastrounddata.Lasttroundschedule().then((value) {
      lastrounddata.LastLocationname; lastrounddata.lasttime;
      setState(() {
        lastroundlocation =  lastrounddata.LastLocationname;
        lastroundtime = lastrounddata.lasttime;
      });
    });
    Nextdata.Nextroundschedule().then((value) {
      Nextdata.nextroundvisit; Nextdata.nextroundtime;
      setState(() {
        nextroundvisitname = Nextdata.nextroundvisit;
        nextroundvisittime = Nextdata.nextroundtime;
      });

    });
    mycounterdata.Counterdata().then((value) {
      mycounterdata.ontimecounter; mycounterdata.delaytimecounter; mycounterdata.missedtimecounter;
      setState(() {
        ontimeroundvalue = mycounterdata.ontimecounter;
        delayroundvalue = mycounterdata.delaytimecounter;
        missedroundvalue = mycounterdata.missedtimecounter;
      });
    });
    _refreshController.loadComplete();
  }
  void _onRefresh() async {
    // your api here
    data.Getschedule().then((value) {
      data.totalmessage;
      setState(() {
        todayroundvalue=data.totalmessage ?? " ";
      });
    });
    Cdata.CtotalRound().then((value) {
      Cdata.completemessage;
      setState(() {
        completeroundvalue = Cdata.completemessage;
      });
    });
    lastrounddata.Lasttroundschedule().then((value) {
      lastrounddata.LastLocationname; lastrounddata.lasttime;
      setState(() {
        lastroundlocation =  lastrounddata.LastLocationname;
        lastroundtime = lastrounddata.lasttime;
      });
    });
    Nextdata.Nextroundschedule().then((value) {
      Nextdata.nextroundvisit; Nextdata.nextroundtime;
      setState(() {
        nextroundvisitname = Nextdata.nextroundvisit;
        nextroundvisittime = Nextdata.nextroundtime;
      });

    });
    mycounterdata.Counterdata().then((value) {
      mycounterdata.ontimecounter; mycounterdata.delaytimecounter; mycounterdata.missedtimecounter;
      setState(() {
        ontimeroundvalue = mycounterdata.ontimecounter;
        delayroundvalue = mycounterdata.delaytimecounter;
        missedroundvalue = mycounterdata.missedtimecounter;
      });
    });
    _refreshController.refreshCompleted();
  }
//scan qr code////////
  Future _scanQR() async {
      scannedQrcode  = await FlutterBarcodeScanner.scanBarcode(
          '#ed1d24', 'Cancel', false, ScanMode.QR);
      var Scanid = scannedQrcode;
      globaldata.scanid = Scanid;
      print("!!!!!");
      print(globaldata.scanid);
      try{
        scandata =  await fetchdata.Scandetails();
        print("###########");
        print(scandata?.qrcodeTable.error);
        if(scandata?.qrcodeTable.error==false){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scanningreport(scandata:scandata,)));
        }
        else {
          Fluttertoast.showToast(
              msg:   "QRLat & QRLong dont match with Device Lat & Long !",
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 5,
              backgroundColor: Color(0xFF184f8d),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
     catch(e){
        print("errrorrrrrrrrrrrr");
        print(e);
     }
  }
  ///Get Lattitude and Longitude///
  getCurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitudedata = '${geoposition.latitude}';
      print("latitudedata");
      print(latitudedata);
      globaldata.Dlattitude = latitudedata.toString();
      longitudedata = '${geoposition.longitude}';
      print("longitude");
      print(longitudedata);
      globaldata.Dlongitude = longitudedata.toString();
    });
    print("Global");
    print(globaldata.Dlattitude);

  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
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
    )) ??
        false;
  }
  @override
  void initState() {
    super.initState();
    getCurrentlocation();
    data.Getschedule().then((value) {
      data.totalmessage;
      setState(() {
        todayroundvalue=data.totalmessage ?? " ";
      });
    });
    Cdata.CtotalRound().then((value) {
      Cdata.completemessage;
      setState(() {
        completeroundvalue = Cdata.completemessage;
      });
    });
    lastrounddata.Lasttroundschedule().then((value) {
      lastrounddata.LastLocationname; lastrounddata.lasttime;
      setState(() {
        lastroundlocation =  lastrounddata.LastLocationname;
        lastroundtime = lastrounddata.lasttime;
      });
    });
    Nextdata.Nextroundschedule().then((value) {
      Nextdata.nextroundvisit; Nextdata.nextroundtime;
      setState(() {
        nextroundvisitname = Nextdata.nextroundvisit;
        nextroundvisittime = Nextdata.nextroundtime;
      });

    });
    mycounterdata.Counterdata().then((value) {
      mycounterdata.ontimecounter; mycounterdata.delaytimecounter; mycounterdata.missedtimecounter;
      setState(() {
        ontimeroundvalue = mycounterdata.ontimecounter;
        delayroundvalue = mycounterdata.delaytimecounter;
        missedroundvalue = mycounterdata.missedtimecounter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("%%%%%%%");
    print(todayroundvalue);
    return WillPopScope(onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(globaldata.Name),
          backgroundColor: const Color(0xFF184f8d),
          actions: [
            InkWell(
              child: Image.asset(
                "images/exitnew.png",
                height: 30,
                width: 30,
              ),
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
            )
          ],
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
                  backgroundImage: NetworkImage(
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black)),
                elevation: 4.0,
                child: ListTile(
                    dense: true,
                    leading: Image.asset(
                      "images/aboutus.png",
                      height: 25,
                    ),
                    title: const Text(
                      'About Us',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aboutus()));
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
                      'Contact Us',
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
                      Icons.history_rounded,
                      size: 30.0,
                      color: Colors.blueAccent,
                    ),
                    title: const Text(
                      'History',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () async{
                      rounddata = await object.RoundSummary();
                     nightnewdata = await nightvalue.NightSummary();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => shiftthistory(rounddata:rounddata,nightnewdata:nightnewdata)));
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
                      Icons.notifications_active,
                      color: Color(0xFF447cf4),
                    ),
                    title: const Text(
                      'Notification',
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => winhistory()));
                    }),
              ),


            ],
          ),
        ),
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.blueAccent)),
                          elevation: 4.0,
                          child: ListTile(
                            onTap: () async {
                              // totalcount = await data.Getschedule();
                              dayround = await data.Dayschedule();
                              nightround = await data.Nightschedule();
                              Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Todayround(
                            dayround:dayround,
                          nightround: nightround,
                        ),));},
                            title: Text(
                              "Today Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            trailing:
                            Text(todayroundvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.blueAccent)),
                          elevation: 4.0,
                          child: ListTile(
                            onTap: () async {
                              //comptotalcount = await Cdata.CtotalRound();
                              CDAYROUND = await Cdata.CompleteDayschedule();
                              CNIGHTROUND = await Cdata.CompleteNightschedule();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Completeround(CDAYROUND:CDAYROUND,CNIGHTROUND:CNIGHTROUND)));},
                            title: Text(
                              "Complete Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            trailing: Text(completeroundvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 700,
                    height: 90,
                    child: Card(
                      margin: const EdgeInsets.all(20.0),
                      elevation: 10.0,
                      shadowColor: Colors.blueAccent,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0xFF184f8d), width: 1.5)),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/qrcode.png',
                              height: 30,
                              width: 30,
                            ),
                            Text(
                              "Scan QR Code",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )],
                        ),
                        onTap: () {
                          _scanQR();
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: MaterialButton(
                          onPressed: (){
                            // alllocation = await locationdata.mylocation();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Incidentrecord()));
                          },
                          child: Text(
                            "Incident",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
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
                          child: MaterialButton(
                            onPressed: () {
                              _callNumber();
                            },
                            child: Text(
                              "SOS",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
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
                   SizedBox(
                    height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),),
                      Text("Today's Activity",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                        margin: new EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                        ),
                        height: 350,
                        child: Column(children: [
                          ListTile(
                            onTap: () async{
                              lastdata = await lastrounddata.Lasttroundschedule();
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => Lastround(lastdata:lastdata)));
                            },
                            title: Text(
                              "Last Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            trailing:
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 10.0)),
                                Text(lastroundlocation,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Text(lastroundtime,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          Divider(thickness: 1,),
                          ListTile(
                            onTap: () async{
                               nextdata = await Nextdata.Nextroundschedule();
                              // Fluttertoast.showToast(
                              //     msg: Nextdata.nextmessage,
                              //     gravity: ToastGravity.BOTTOM,
                              //     toastLength: Toast.LENGTH_LONG,
                              //     timeInSecForIosWeb: 5,
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.white,
                              //     fontSize: 16.0);
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => Nextround(nextdata:nextdata)));
                            },
                            title: const Text(
                              "Next Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                            trailing:  Column(
                              children: [
                                Text(nextroundvisitname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Text(nextroundvisittime.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          Divider(thickness: 1,),
                          ListTile(
                            onTap: () async{
                              ontimedata = await timedata.OnTimes();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Ontimerounddata(ontimedata:ontimedata)));
                            },
                            title: Text(
                              "ON Time Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            trailing: Text(ontimeroundvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                          Divider(thickness: 1,),
                          ListTile(
                            onTap: () async {
                              delaytimedata = await timedata.OnDelayTime();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Delaytimedata(delaytimedata:delaytimedata)));
                            },
                            title: Text(
                              "Delay Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            trailing: Text(delayroundvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                          Divider(thickness: 1,),
                          ListTile(
                            onTap: () async{
                              missrounddata = await timedata.MissedTime();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Missedrounddata(missrounddata:missrounddata)));
                            },
                            title: Text(
                              "Missed Round",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            trailing: Text(missedroundvalue,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),])),
                  ),
                ],),
            ),
          ),
        ),
      ),
    );
  }

  _callNumber() async{
    const number = '09910036432'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
