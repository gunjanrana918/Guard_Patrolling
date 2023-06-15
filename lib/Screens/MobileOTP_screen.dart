
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../Controllers/Login_controller.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      // ignore: deprecated_member_use
      hintColor: Colors.deepOrange,
    ),
    home: OTPchangepassword(),
  ));
}
// ignore: camel_case_types
class OTPchangepassword extends StatefulWidget {
  @override
  _OTPchangepasswordState createState() => _OTPchangepasswordState();
}
// ignore: camel_case_types
class _OTPchangepasswordState extends State<OTPchangepassword> {
  final OTPvalidcontroller otpdata = Get.put(OTPvalidcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Column(
        children: [
          SizedBox(height: 40.0,),
          Padding(
            padding: EdgeInsets.all(15.0),
            child:  Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: otpdata.mobiletextcontroller,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      hintText: 'Enter mobile No.',
                    )),
              ),
            ]),
          ),
          Padding(padding: EdgeInsets.only(top: 30.0)),
          // ignore: deprecated_member_use
          MaterialButton(
              color: Color(0xFF184f8d),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () async {
                if(otpdata.mobiletextcontroller.text.isEmpty){
                  Fluttertoast.showToast(
                      msg: "Enter 10 digit Mobile no",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 15.0);
                }
                else  {
                  otpdata.MobileOTP(context);
                  otpdata.mobiletextcontroller.clear();
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => SmsVerificationPage()));
                }
              })
        ],
      ),
    );
  }
}
