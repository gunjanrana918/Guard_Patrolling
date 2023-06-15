// import 'dart:html';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../Controllers/FetchScan_Report.dart';
import '../Models/Scandata_model.dart';
import 'package:http/http.dart' as http;

import '../Models/SendScan_Report.dart';
import 'Admin_dashboard.dart';
import 'Dashboard.dart';

class Scanningreport extends StatefulWidget {
  Scandata? scandata;
   Scanningreport({Key? key, this.scandata,  }) : super(key: key);

  @override
  State<Scanningreport> createState() => _ScanningreportState();
}
int index = 0;
class _ScanningreportState extends State<Scanningreport> {
  var newmessage;
  final Fetchscanreport fetchdata = Get.put(Fetchscanreport());
  TextEditingController remarkcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  File? imageFile;
  final picker = ImagePicker();
  get scannedQrcode => null;
  List _selecteCategorys = [];
  List Unselectitem=[];
  List  refrshlist=[];
  late String _mycheckpint = "";
  var newdata;

  String? newtime;
  var Comparetime ="";
  String latitudedata = "";
  String longitudedata = "";
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
  //****Send Scan data API*****////

  Sendreprtdata() async{
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(DateTime.now());
    setState(() {
      newtime=formattedTime;
    });
    print("newfile");
    print(newtime);
    print("object");
    print(newtime);
    if(newtime==globaldata.sceduletime){
      Comparetime="1";
    }
    else{
      Comparetime="2";
    }
    print("Comparetime");
    print(Comparetime);
    var request = http.MultipartRequest('POST', Uri.parse('http://103.25.130.254/Helpdesk/Api/Scanreport'));
    request.fields.addAll({
      'reportname': ' ',
      'reportdesc': remarkcontroller.text,
      "qrid" : globaldata.scanid,
      'gid': globaldata.GID,
      'Scheduleid': widget.scandata!.qrcodeTable.scheduleId,
      'checkid': _mycheckpint,
      'locationid': widget.scandata!.qrcodeTable.locationCode,
      'reportlocation':  widget.scandata!.qrcodeTable.locationName,
       'reportcheckpoint': _selecteCategorys.toString(),
      // 'Uncheckpoint':Unselectitem.toString(),
      'latitude':latitudedata,
      'longitude':longitudedata,
      'shift': fetchdata.globalshift,
      'status': Comparetime
    });
    var file = await http.MultipartFile.fromPath(' ',  imageFile!.path);
    request.files.add(file);
    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    if(response.statusCode==200){
      print("DATA1");
      print(responseData);
      var newparsedata = SendQrReport.fromJson(json.decode(responseData));
      print(newparsedata.scanreportTable[index].msg);
      newmessage = newparsedata.scanreportTable[index].msg;
      print("message");
      print(newmessage);
      globaldata.PostMessage = newmessage;
      print( globaldata.PostMessage );
      Fluttertoast.showToast(
          msg: globaldata.PostMessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
      if(globaldata.usertype=='1'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            Dashboardscreen(),));
      } else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            admindashboard(),));
      }
    }
    else{
      Fluttertoast.showToast(
          msg: globaldata.PostMessage,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  @override
  void initState() {
     getCurrentlocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guard Patrolling Report"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5.0),
          child:
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),),
            Text("Location",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ],
          ),),
            Padding(padding: EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                width: 400,
                child: TextFormField(
                  readOnly: true,
                  controller: passcontroller,
                  //keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: widget.scandata!.qrcodeTable.locationName,
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent,width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 12)),
                Text("Key CheckParameter",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.blueAccent)
                ),
                padding: EdgeInsets.only(left: 5, right: 0, top: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: false,
                          child: DropdownButton<String>(
                            value: _mycheckpint.isNotEmpty ? _mycheckpint:null,
                            iconSize: 50,
                            iconEnabledColor: Color(0xFF184f8d),
                            icon: (null),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            hint: Text('Select Parameter',style: TextStyle(color: Colors.black)),
                            onChanged: ( newValue) {
                              setState(() {
                                _mycheckpint = newValue!;
                              });
                            },
                            items: widget.scandata!.qrcodeTable.checkPoitTable.map((item) {
                              return  DropdownMenuItem(
                                child:  Text(item.checkPointName),
                                value: item.checkPointId.toString(),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Padding(padding: EdgeInsets.only(top: 10.0)),
            Container(
              height: 230,
              child: ListView.builder(
                itemCount: widget.scandata!.qrcodeTable.checkPoitTable.length,
                  itemBuilder: (BuildContext context, int index){
                  return CheckboxListTile(
                      title: Text(widget.scandata!.qrcodeTable.checkPoitTable[index].checkPointName),
                      value: _selecteCategorys.contains(widget.scandata!.qrcodeTable.checkPoitTable[index].checkPointName,)??false,
                      onChanged: (bool? selected){
                        _onCategorySelected(selected!, widget.scandata!.qrcodeTable.checkPoitTable[index].checkPointName,
                        );
                      });
                  }
                  ),

            ),
            Padding(padding: EdgeInsets.all(5.0),
              child:
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text("Observation Report",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),),],
              ),),
            Padding(padding: EdgeInsets.all(5.0),
              child: Container(
                height: 180,
                width: 400,
                child: TextFormField(
                  controller: remarkcontroller,
                  minLines: 30,
                  maxLines: 200,
                  decoration: InputDecoration(
                    hintText: "Type your text here.........",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                  ),
                  height: 70,
                  width: 80,
                  child: IconButton(
                      onPressed: ()  { openCamera();
                      },
                      icon: Icon(Icons.cameraswitch_rounded,size: 40,)),
                ),

                imageFile != null
                    ? Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(imageFile!)  ,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                    ),
                    height: 70,
                    width: 80,
                    child:
                    Center(child: Text("Image Preview",textAlign: TextAlign.center,))
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.only(top:50.0),
              child: SizedBox(
                height: 50,
                width: 180,
                child: MaterialButton(
                    color: const Color(0xFF184f8d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: (){
                      if(remarkcontroller.text.isEmpty){
                        Fluttertoast.showToast(
                            msg: "Please fill Observation.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 6,
                            backgroundColor: Color(0xFF184f8d),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else
                        if(_mycheckpint.isEmpty){
                          Fluttertoast.showToast(
                              msg: "Please select checkparameter.",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else
                        if(imageFile==null){
                          Fluttertoast.showToast(
                              msg: "Please select image.",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else {
                          Sendreprtdata();
                          Mail();
                              setState(() {
                                widget.scandata!.qrcodeTable.locationName = "";
                                remarkcontroller.clear();
                                passcontroller.clear();
                                _mycheckpint = "";
                                imageFile = null;
                              });
                        }
                        },
                    child: Text("Submit Report",style: TextStyle(color: Colors.white,fontSize: 18.0),)),
              ) ,
            ),
          ],
        ),
      ),
    );
  }

  void _onCategorySelected(bool selected, category_name,) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_name);
        print(_selecteCategorys);
      });


    }
    else {
      setState(() {
       _selecteCategorys.remove(category_name);
      });
    }

  }
///Mailing function//****
  Mail() async {
    print("mail");
    String username = "auto.invoice@gateway-distriparks.com";
    String password = "FD!@#shjds123JH";
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('vivek.shirke@gatewaydistriparks.com') //recipent email
      ..ccRecipients.addAll(['vikrant.dayala@gatewaydistriparks.com','gunjan.rana@gatewaydistriparks.com']) //cc Recipents emails
      ..bccRecipients.add(Address('test@test.com')) //bcc Recipents emails
      ..subject = 'Patrolling Report Data' //subject of the email
      ..attachments.add(FileAttachment(imageFile!))
      ..html="<p>Guard Name : ${globaldata.Name}\n</p><p>Location : ${widget.scandata!.qrcodeTable.locationName}</p>\n <p>Checkpoint : ${widget.scandata!.qrcodeTable.checkPoitTable[index].checkPointName}</p>\n <p>"
          "Shift : ${fetchdata.globalshift}</p>\n<p>status : ${Comparetime}</p>\n<p>Observation Report : ${remarkcontroller.text}</p> "
    ..attachments.add(FileAttachment(imageFile!)); //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n'+ e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
  Future<void> openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 25);
    setState((){
      imageFile = File(pickedFile!.path);
    });
    print("ABCD");
    print(imageFile);
  }
}
