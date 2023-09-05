import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guard_patrolling/Controllers/Login_controller.dart';
import 'package:guard_patrolling/Models/Login_models.dart';
import 'package:guard_patrolling/Screens/Admin_dashboard.dart';
import 'package:guard_patrolling/Screens/Dashboard.dart';
import 'package:guard_patrolling/Screens/MobileOTP_screen.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loginscreen(),
  ));
}
late SharedPreferences localstorage;
class Loginscreen extends StatefulWidget {
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final Logincontroller obj = Get.put(Logincontroller());
  final Schedulecontroller data = Get.put(Schedulecontroller());
  final Completecontroller Cdata = Get.put(Completecontroller());
  final Nextroundcontroller Nextdata = Get.put(Nextroundcontroller());
  final Countercontroller mycounterdata = Get.put(Countercontroller());
  final Lastroundcontroller lastrounddata = Get.put(Lastroundcontroller());
  bool isObsecure = true;
  TextEditingController mobileCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  late SharedPreferences? logindata = null;
  bool? newuser;
  Userdata? fromdata ;
  late SharedPreferences sharedPreferences;
  get index => null;
  var Generateotp;


  Future<void> main() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    globaldata.GID = prefs.getString('GID')!;
    globaldata.LoginID = prefs.getString("LoginID")!;
    globaldata.usertype = prefs.getString("UserType")!;
    print(globaldata.GID);
    globaldata.Name = prefs.getString("Name").toString();
    globaldata.PhoneNo = prefs.getString('Mobile').toString();
    globaldata.EMail = prefs.getString('Email').toString();
    globaldata.Address = prefs.getString('Address').toString();
    globaldata.State = prefs.getString('State').toString();
    globaldata.Picode = prefs.getString('Picode').toString();
    print(globaldata.GID);
    if (globaldata.GID.isNotEmpty){
      Future.delayed(Duration(seconds: 3), (){
        print("Executed after 5 seconds");
      });
       if(globaldata.usertype=="1"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            Dashboardscreen(),));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            admindashboard(),));
      }

    }
    else{
      await Future.delayed(const Duration(milliseconds: 1000));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          Loginscreen(),));
    }

  }
  @override
  void initState() {
    super.initState();
   main();
  }
  @override
  void dispose() {
    obj.mobileCont.clear();
    obj.passCont.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(),
              Container(
                height: 120,
                width: 130,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/logo-removebg-preview.png',),
                        fit: BoxFit.cover)),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Padding(padding: EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  elevation: 3.0,
                  child: TextFormField(
                    controller: obj.mobileCont,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(Icons.phone_android_rounded,color: Color(0xFF184f8d),),
                        hintText: 'User ID/Mobile No.',
                        hintStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),),
              Padding(padding: EdgeInsets.all( 5.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  elevation: 3.0,
                  child:
                  TextFormField(
                    controller: obj.passCont,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: Icon(Icons.lock_clock_rounded,color: Color(0xFF184f8d)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon:
                      GestureDetector(
                        child:
                        Icon(
                          isObsecure ? Icons.visibility : Icons.visibility_off,color: Colors.black,),
                        onTap: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                      ),
                    ),
                  ),
                ),),
              Padding(padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("Forgot Password?",style: TextStyle(
                            color: Color(0xFF184f8d),fontSize: 16.0,),),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTPchangepassword()));
                        }, ),
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 50,
                  width: 200,
                  child: MaterialButton(
                      color: Color(0xFF184f8d),
                      child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18.0),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      onPressed: () async {
                        if (obj.mobileCont.text.isEmpty && obj.passCont.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter valid credentials!",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (obj.passCont.text.isEmpty){
                          Fluttertoast.showToast(
                              msg: "Please enter password!",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else  {
                            fromdata = await obj.loginbutton(context);
                        }
                      }),
                ) ,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
