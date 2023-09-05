
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guard_patrolling/Models/DaySchedulemodel.dart';
import 'package:guard_patrolling/Models/Get_locationmodel.dart';
import 'package:guard_patrolling/Models/Login_models.dart';
import 'package:guard_patrolling/Models/NightSchedulemodel.dart';
import 'package:guard_patrolling/Models/OnTime_round.dart';
import 'package:guard_patrolling/Screens/Admin_dashboard.dart';
import 'package:guard_patrolling/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:guard_patrolling/universaldata.dart';
import '../Models/Complete Day Round.dart';
import '../Models/Complete Night Round.dart';
import '../Models/Counter_ON_DELAY_MISSED.dart';
import '../Models/DelayTime_round.dart';
import '../Models/Forgotpassword.dart';
import '../Models/DayHistory_Round.dart';
import '../Models/LastRoundmodel.dart';
import '../Models/Missedtime_data.dart';
import '../Models/NextRound.dart';
import '../Models/Night_Roundhistory.dart';
import '../Models/OTPModel_class.dart';
import '../Models/Profile_Model.dart';
import '../Models/Schedule.dart';
import '../Models/Total_CompleteCount.dart';
import '../RoundHistory/Guard_Historydetails.dart';
import '../Screens/Dashboard.dart';
import '../Screens/Guard_HistorySearch.dart';
import '../Screens/verifyOTP_screen.dart';


class Logincontroller extends GetxController {
  TextEditingController mobileCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  var isLoading = true.obs;
  List<Userdata> list = [];
  var error = 'error'.obs;
  var logmessage;

  loginbutton(context) async {
    int index = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/Login'));
    request.body = json.encode({
      "UserId": mobileCont.text,
      "Password": passCont.text
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print(jsonDecode(responseData));
        if(responseData.toString().contains("Invalid")){
       var Data = responseData.toString().split(":") ;
       var newmsg = Data[3].replaceAll("GID", "").replaceAll(",","").replaceAll("\"", "");
       print(newmsg);
          Fluttertoast.showToast(
              msg: newmsg,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 5,
              backgroundColor: Color(0xFF184f8d),
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
        var Userinfo = Userdata.fromJson(jsonDecode(responseData));
        print(Userinfo);
        if(Userinfo.login[index].error==false){
          sharedPreferences.setString('msg',Userinfo.login[index].msg);
          sharedPreferences.setString('Name',Userinfo.login[index].name);
          sharedPreferences.setString('Mobile',Userinfo.login[index].phoneNo);
          sharedPreferences.setString('Email',Userinfo.login[index].eMail);
          sharedPreferences.setString('Address',Userinfo.login[index].address);
          sharedPreferences.setString('State',Userinfo.login[index].state);
          sharedPreferences.setString('Picode',Userinfo.login[index].picode);
          sharedPreferences.setString('GID',Userinfo.login[index].gid);
          sharedPreferences.setString('LoginID',Userinfo.login[index].loginId);
          sharedPreferences.setString('UserType',Userinfo.login[index].userType);
          var loginid = sharedPreferences.getString("LoginID");
          // logmessage = sharedPreferences.getString("msg")!;
          // globaldata.LoginMessage = logmessage;
          print(globaldata.LoginMessage);
          globaldata.LoginID = loginid!;
          print("LOGINID");
          print(globaldata.LoginID);
          var usertype = sharedPreferences.get("UserType");
          globaldata.usertype= usertype.toString();
          var name = sharedPreferences.getString('Name');
          globaldata.Name = name.toString();
          var email = sharedPreferences.getString('Email');
          globaldata.EMail = email.toString();
          var mobile = sharedPreferences.getString('Mobile');
          globaldata.PhoneNo = mobile.toString();
          var address = sharedPreferences.getString('Address');
          var gid = sharedPreferences.getString('GID');
          globaldata.GID = gid.toString();
          globaldata.Address = address.toString();
          var state = sharedPreferences.getString('State');
          globaldata.State = state.toString();
          var pincode = sharedPreferences.getString('Picode');
          globaldata.Picode = pincode.toString();
          print(globaldata.Picode);
          Fluttertoast.showToast(
              msg: Userinfo.login[index].msg,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 3,
              backgroundColor: Color(0xFF184f8d),
              textColor: Colors.white,
              fontSize: 16.0);
          if(Userinfo.login[index].userType=="1"){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                Dashboardscreen(),));
          }
          else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                admindashboard(),));
          }



        }
        else {
          Fluttertoast.showToast(
              msg: Userinfo.login[index].msg,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 5,
              backgroundColor: Color(0xFF184f8d),
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return Userinfo;
      }
      else{
        Fluttertoast.showToast(
            msg: globaldata.LoginMessage,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            backgroundColor: Color(0xFF184f8d),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    catch (e){
      Fluttertoast.showToast(
          msg: "Invalid UserId & Password!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);

    }

    }



  }

  class Profilecontroller extends GetxController{
    TextEditingController updatename = TextEditingController();
    TextEditingController updatemobile = TextEditingController();
    TextEditingController updateemail = TextEditingController();
    TextEditingController updateaddresss = TextEditingController();
    TextEditingController updatestate = TextEditingController();
    TextEditingController updatepincode = TextEditingController();
    var isLoading = true.obs;
    List<Profilemodel> list = [];
    var error = 'error'.obs;
    updateprofile(context) async {
      int index = 0;
      isLoading(true);
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('http://103.25.130.254/Helpdesk/Api/updateUserProfile'));
      request.body = json.encode({
        "UserId": globaldata.GID,
        "Name": updatename.text,
        "PhoneNo": updatemobile.text,
        "EMail": updateemail.text,
        "Address": updateaddresss.text,
        "Photo": "",
        "State": updatestate.text,
        "Picode": updatepincode.text
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      try {
        if (response.statusCode == 200) {
          var responseDataa = await response.stream.bytesToString();
          print("??????");
          print(responseDataa);
          print("??????");
          var Profileinfo = Profilemodel.fromJson(jsonDecode(responseDataa));
          print(Profileinfo);
          var profilemessage = Profileinfo.login[index].msg;
          globaldata.updatemessage = profilemessage.toString();
          print(Profileinfo.login[index].msg);
          if(Profileinfo.login[index].error==false){
            Fluttertoast.showToast(
                msg: Profileinfo.login[index].msg,
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 3,
                backgroundColor: Color(0xFF184f8d),
                textColor: Colors.white,
                fontSize: 16.0);
            updatename.clear();
            updatemobile.clear();
            updateemail.clear();
            updateaddresss.clear();
            updatestate.clear();
            updatepincode.clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                Loginscreen(),));
          }
          else {
            Fluttertoast.showToast(
                msg: Profileinfo.login[index].msg,
                gravity: ToastGravity.BOTTOM,
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 5,
                backgroundColor: Color(0xFF184f8d),
                textColor: Colors.white,
                fontSize: 16.0);
          }
          return Profileinfo;
        }
        else{
          Fluttertoast.showToast(
              msg: globaldata.updatemessage,
              gravity: ToastGravity.BOTTOM,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 5,
              backgroundColor: Color(0xFF184f8d),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      catch (e){
        Fluttertoast.showToast(
            msg: "Invalid UserId & Password!",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            backgroundColor: Color(0xFF184f8d),
            textColor: Colors.white,
            fontSize: 16.0);

      }

    }
  }


class Schedulecontroller extends GetxController{
  var isDataloading = false.obs;
  List<TotalRound> list = [];
  List<DayRound> daylist = [];
  List<NightRound> nightlist = [];
   String? totalmessage;

   Future<void> Getschedule()  async{
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    try {
      var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Count'));
      request.body = json.encode({
        "UserId": globaldata.GID,
        "ReportType":"Count"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var responseData = await response.stream.bytesToString();
      if(response.statusCode == 200){
        print(responseData);
        print("object");
        var countdata = TotalRound.fromJson(jsonDecode(responseData));
        print(countdata.count[index].msg);
        totalmessage = countdata.count[index].totalCount;
        globaldata.Totalroundcount = totalmessage!;
        globaldata.Toatlresponsemessage = countdata.count[index].msg;
    } else
      {
        // Fluttertoast.showToast(
        //     msg: globaldata.Toatlresponsemessage,
        //     gravity: ToastGravity.BOTTOM,
        //     toastLength: Toast.LENGTH_LONG,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Color(0xFF184f8d),
        //     textColor: Colors.white,
        //     fontSize: 16.0);

      }
    } catch (e) { throw(e); }



  }
  ////Day round details
 Future<DayRound?> Dayschedule() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Schedule'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Day"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
       var daydata = DayRound.fromJson(jsonDecode(responseData));
       var Nround = daydata.schedule[index].msg;
       globaldata.Totaldaymessage = Nround;
      return daydata ;
    }
    else {
      Fluttertoast.showToast(
          msg:globaldata.Totaldaymessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    return null;
  }
  /////Night round
 Future<NightRound?> Nightschedule() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Schedule'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Night"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
     var  nightdata = NightRound.fromJson(jsonDecode(responseData));
      var round = nightdata.schedule[index].msg;
      globaldata.Nightroundmessage = round;
      print("nightdata");
      print(nightdata);
      return nightdata;
    }
    else {
      Fluttertoast.showToast(
          msg: globaldata.Nightroundmessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    return null;
  }
}

////Complete Round API'S////
class Completecontroller extends GetxController{
  var isDataloading = false.obs;
  List<CompleteTotalCount> list = [];
  List<CompleteDayRound> daylist = [];
  List<CompleteNightRound> nightlist = [];
  late String completemessage;

 Future<void> CtotalRound() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/CompleteCount'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType": "Count"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var ctotaldata = CompleteTotalCount.fromJson(jsonDecode(responseData));
      print(ctotaldata.count[0].msg);
      completemessage = ctotaldata.count[index].totalCount;
      globaldata.Completetotalcount = completemessage;
    }
    else
    {
      Fluttertoast.showToast(
          msg: "No Data Found",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }
  ////Day round details
  Future<CompleteDayRound?> CompleteDayschedule() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/CompleteRound'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Day"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var completedaydata = CompleteDayRound.fromJson(jsonDecode(responseData));
      globaldata.Completedaymessage = completedaydata.schedule[index].msg;
      return completedaydata;
    }
    else {
      // Fluttertoast.showToast(
      //     msg:globaldata.Completedaymessage,
      //     gravity: ToastGravity.BOTTOM,
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

    }
    return null;
  }
  /////Night round
  Future<CompleteNightRound?> CompleteNightschedule() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/CompleteRound'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Night"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var  completenightdata = CompleteNightRound.fromJson(jsonDecode(responseData));
      globaldata.Completenightmessage = completenightdata.schedule[index].msg.toString();
      print(  globaldata.Completenightmessage);
      print("nightdata");
      print(completenightdata);
      return completenightdata;
    }
    else {
      Fluttertoast.showToast(
          msg: globaldata.Completenightmessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    return null;
  }
}

class Nextroundcontroller extends GetxController{
  var isDataloading = true.obs;
  List<NextRound> list = [];
   String nextmessage ="";
   String nextroundvisit ="";
   String nextroundtime = "";
  Future<NextRound?> Nextroundschedule() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/nextround'));
    request.body = json.encode({
      "UserId": globaldata.GID
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var Nextrounddata = NextRound.fromJson(jsonDecode(responseData));
      nextmessage = Nextrounddata.schedule[index].msg;
      nextroundvisit = Nextrounddata.schedule[index].locationName;
      nextroundtime = Nextrounddata.schedule[index].scheduleTime;
      print("Nextrounddata");
      print(Nextrounddata);
      return Nextrounddata;
    }
    else{
      // Fluttertoast.showToast(
      //     msg: nextmessage.toString(),
      //     gravity: ToastGravity.BOTTOM,
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
    return null;
  }
  }

class Lastroundcontroller extends GetxController{
  var isDataloading = true.obs;
  List<LastRound> list = [];
  String? lastmessage;
  String LastLocationname= "";
  String lasttime ="" ;
   String? shift;
  Future<LastRound?>Lasttroundschedule() async {
    int index =0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/lastround'));
    request.body = json.encode({
      "UserId": globaldata.GID
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var Lastrounddata = LastRound.fromJson(jsonDecode(responseData));
      lastmessage = Lastrounddata.schedule[index].msg.toString();
      LastLocationname = Lastrounddata.schedule[index].locationName;
      globaldata.lastroundlocation = LastLocationname.toString();
      lasttime = Lastrounddata.schedule[index].scheduleTime;
      shift = Lastrounddata.schedule[index].shift.toString();
      globaldata.Lasttime = lasttime.toString();
      print("LAST");
      print(lasttime);
      print(Lastrounddata);
      return Lastrounddata;
    }
    else{
      // Fluttertoast.showToast(
      //     msg: lastmessage.toString(),
      //     gravity: ToastGravity.BOTTOM,
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
    return null;
  }
}

class Getlocation extends GetxController{
  var isDataloading = true.obs;
  List<GetLocation> listed = [];
  var decodedata;
  mylocation() async {
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/Location'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      Future.delayed(Duration(seconds: 5), () {
        print(responseData);
        decodedata = GetLocation.fromJson(jsonDecode(responseData));
        print("GetLocation");
        print(decodedata);
        return decodedata;
      });
    }
    else{
      Fluttertoast.showToast(
          msg: "Data Not Found!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

///*** round history****////
class Historyroundcontroller extends GetxController{
  var isDataloading = true.obs;
  List<DayHistory> list = [];
  DayHistory? rounddata;
  NightHistory? nightnewdata;
 RoundSummary(context) async {
int index=0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/DayHistory'));
    request.body = json.encode({
      "UserId": globaldata.GID
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var RoundData = DayHistory.fromJson(jsonDecode(responseData));
      if(RoundData.schedule[index].error==false){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => shiftthistory()));
      }
      print("RoundHistory");
      print(RoundData);
      return RoundData;
    }
    else{
      Fluttertoast.showToast(
          msg: "Data Not Found!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

class NightRoundhistory extends GetxController{
  var isDataloading = true.obs;
  List<NightHistory> list = [];
  NightSummary() async {
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/NightHistory'));
    request.body = json.encode({
      "UserId": globaldata.GID
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var NightData = NightHistory.fromJson(jsonDecode(responseData));
      print("NightHistory");
      print(NightData);
      return NightData;
    }
    else{
      Fluttertoast.showToast(
          msg: "Data Not Found!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}

class Fpasswordcontroller extends GetxController {
  final newpasswordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  var isLoading = true.obs;
  List<Resetpassword> list = [];
  var error = 'error'.obs;

  var mypassword;
  resetpassword() async {
    int index = 0;
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://103.25.130.254/Helpdesk/Api/forgotpwd'));
    request.body = json.encode({
      "UserId": globaldata.LoginID,
      "Password": confirmpasswordcontroller.text
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(responseData);
      var newpasword = Resetpassword.fromJson(jsonDecode(responseData));
      print(newpasword.resetpwd[index].msg);
      mypassword = newpasword.resetpwd[index].msg;
      Fluttertoast.showToast(
          msg:mypassword,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
      return newpasword;

    }
    else {
      Fluttertoast.showToast(
          msg:mypassword,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }}
//OTP API////
class OTPvalidcontroller extends GetxController{
  final TextEditingController mobiletextcontroller = TextEditingController();
  List<OtPvalidation> list = [];
  var validnewotp;
  MobileOTP(context) async {
    int index=0;
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://103.25.130.254/Helpdesk/Api/OTP'));
    request.body = json.encode({
      "UserId": mobiletextcontroller.text,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(responseData);
      var validotpresponse = OtPvalidation.fromJson(jsonDecode(responseData));
      print(validotpresponse);
      validnewotp = validotpresponse.login[index].msg;
      globaldata.LoginID = validotpresponse.login[index].loginId;
      print("&&&&&");
      print(validnewotp);
      if(validotpresponse.login[index].error==false){
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => SmsVerificationPage()));
        // Fluttertoast.showToast(
        //     msg:validotpresponse.login[index].msg,
        //     gravity: ToastGravity.BOTTOM,
        //     toastLength: Toast.LENGTH_LONG,
        //     timeInSecForIosWeb: 5,
        //     backgroundColor: Color(0xFF184f8d),
        //     textColor: Colors.white,
        //     fontSize: 16.0);

      } else {
        Fluttertoast.showToast(
            msg:validotpresponse.login[index].msg,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            backgroundColor: Color(0xFF184f8d),
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return validotpresponse;
    }
    else {
      Fluttertoast.showToast(
          msg:validnewotp,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}

class RoundDetails extends GetxController{
  var isDataloading = true.obs;
  List<Ontimeround> ontimelist = [];
  List<Delayround> delaytimelist = [];
  late String Timemessage;
 late String Delaytimemessage;
  late String Missedroundmessage;
  OnTimes() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Ontime'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Ontime"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var ontimerounddata = Ontimeround.fromJson(jsonDecode(responseData));
      Timemessage = ontimerounddata.schedule[index].msg;
      print("Nextrounddata");
      print(ontimerounddata);
      return ontimerounddata;
    }
    else{
      Fluttertoast.showToast(
          msg: "Data not found",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  OnDelayTime() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Ontime'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Delay"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var delaytimedata = Delayround.fromJson(jsonDecode(responseData));
      Delaytimemessage = delaytimedata.schedule[index].msg;
      print(delaytimedata);
      return delaytimedata;
    }
    else{
      Fluttertoast.showToast(
          msg: "Data not found",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  MissedTime() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/Ontime'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Missed"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var misseddata = Missedround.fromJson(jsonDecode(responseData));
      Missedroundmessage = misseddata.schedule[index].msg.toString();
      print(misseddata);
      return misseddata;
    }
    else{
      Fluttertoast.showToast(
          msg: "Data not found",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}

class Countercontroller extends GetxController{
  var isDataloading = false.obs;
  List<CountTimeData> list = [];
  String Countermessage ='' ;
   String ontimecounter = '' ;
   String delaytimecounter = '';
   String missedtimecounter = '';
  Future<void> Counterdata() async {
    int index = 0;
    isDataloading(true);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://103.25.130.254/helpdesk/Api/OntimeCount'));
    request.body = json.encode({
      "UserId": globaldata.GID,
      "ReportType":"Count"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode == 200){
      print(responseData);
      var newcounterdata = CountTimeData.fromJson(jsonDecode(responseData));
      print(newcounterdata.count[0].msg);
      ontimecounter = newcounterdata.count[index].onTime;
      globaldata.Ontimecounter = ontimecounter.toString();
      delaytimecounter = newcounterdata.count[index].dealyCount;
      missedtimecounter = newcounterdata.count[index].missedCount;
    }
    else
    {
      // Fluttertoast.showToast(
      //     msg: globaldata.Toatlresponsemessage,
      //     gravity: ToastGravity.BOTTOM,
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Color(0xFF184f8d),
      //     textColor: Colors.white,
      //     fontSize: 16.0);

    }
  }



}


