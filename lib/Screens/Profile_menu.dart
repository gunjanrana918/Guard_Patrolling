import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:guard_patrolling/universaldata.dart';
import '../Controllers/Login_controller.dart';
import '../Models/Login_models.dart';
class Profilemenu extends StatefulWidget {
  Userdata? fromdata;
  Profilemenu({Key? key, this.fromdata}) : super(key: key);

  @override
  State<Profilemenu> createState() => _ProfilemenuState();
}
int index = 0;
class _ProfilemenuState extends State<Profilemenu> {
  final Profilecontroller newprofile = Get.put(Profilecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: ListView(
        children: [
        Container(
        height: 140,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 60.0,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage:
                    NetworkImage(
                        "https://cdn.icon-icons.com/icons2/1378/PNG/512/"
                            "avatardefault_92824.png"),
                  ),
                ),
              ],),
          ),
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updatename,
                decoration: InputDecoration(
                    labelText: globaldata.Name.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updateemail,
                decoration: InputDecoration(
                    labelText: globaldata.EMail.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updatemobile,
                decoration: InputDecoration(
                    labelText: globaldata.PhoneNo.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updateaddresss,
                decoration: InputDecoration(
                    labelText: globaldata.Address.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updatestate,
                decoration: InputDecoration(
                    labelText: globaldata.State.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newprofile.updatepincode,
                decoration: InputDecoration(
                    labelText: globaldata.Picode.replaceAll(":", ""),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 5.0),
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0),
              child: Container(
                height: 40,
                width: 150,
                child: MaterialButton(
                    color: Color(0xFF184f8d),
                    child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 18.0),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () async {
                      if (newprofile.updatename.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Name!",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (newprofile.updateemail.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter E-mail!",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (newprofile.updatemobile.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Phone no.!",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      else {
                        newprofile.updateprofile(context);
                      }
                    }),
              ) ,
            ),
          ],
        )
        ],
      ),
    );
  }
}
class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

