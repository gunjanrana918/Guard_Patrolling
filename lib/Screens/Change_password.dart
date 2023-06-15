import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guard_patrolling/Screens/login.dart';

import '../Controllers/Login_controller.dart';
import '../Models/Forgotpassword.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      // ignore: deprecated_member_use
      hintColor: Colors.deepOrange,
    ),
    home: changepassword(),
  ));
}

// ignore: camel_case_types
class changepassword extends StatefulWidget {
  @override
  _changepasswordState createState() => _changepasswordState();
}

// ignore: camel_case_types
class _changepasswordState extends State<changepassword> {
  Resetpassword? passcode;
  bool ishiddenpassword = false;
  bool isObsecure = true;
  bool isObsecures = true;
  @override
  Widget build(BuildContext context) {
    final Fpasswordcontroller updatepassword = Get.put(Fpasswordcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Column(
      children: [
        SizedBox(height: 40.0,),
      Padding(
        padding: EdgeInsets.all(8.0),
        child:  Row(children: <Widget>[
          Expanded(
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: updatepassword.newpasswordcontroller,
                obscureText: isObsecure,
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: 'Enter new password',
                    suffixIcon: GestureDetector(
                      child:
                      Icon(
                        isObsecure ? Icons.visibility : Icons.visibility_off,color: Colors.black,),
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                    ),
                )),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child:  Row(children: <Widget>[
          Expanded(
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: updatepassword.confirmpasswordcontroller,
                obscureText: isObsecures,
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    hintText: 'Enter confirm password',
                    suffixIcon: GestureDetector(
                        child: Icon(
                          isObsecures
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            isObsecures = !isObsecures;
                          });
                        })
                )
            ),
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
           if (updatepassword.newpasswordcontroller.text.length == 0) {
              Fluttertoast.showToast(
                  msg: "Enter new password",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 13.0);
              return;
            } else if (updatepassword.confirmpasswordcontroller.text.length == 0) {
              Fluttertoast.showToast(
                  msg: "Enter confirm password",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 13.0);
              return;
            } else if (updatepassword.newpasswordcontroller.text !=
                updatepassword.confirmpasswordcontroller.text) {
              Fluttertoast.showToast(
                  msg: "New password and Confirm password does not match",
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 13.0);
              // ignore: deprecated_member_use
              print("value");
              return;
            }
            else  {
              passcode = await updatepassword.resetpassword();
              updatepassword.newpasswordcontroller.clear();
              updatepassword.confirmpasswordcontroller.clear();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Loginscreen()));
            }
          })
      ],
      ),
    );
  }

}
