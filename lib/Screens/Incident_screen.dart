//import 'dart:html';
import 'dart:convert';
import 'dart:io'; // for File
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guard_patrolling/Controllers/Get_Location.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../Controllers/Login_controller.dart';
import '../Models/IncidentModel.dart';

class Incidentrecord extends StatefulWidget {
  Incidentrecord({
    Key? key,
  }) : super(key: key);

  @override
  State<Incidentrecord> createState() => _IncidentrecordState();
}

class _IncidentrecordState extends State<Incidentrecord> {
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  final Getlocation obj = Get.put(Getlocation());
  int index = 0;
  File? imageFile;
  String latitudedata = "";
  String longitudedata = "";
  List<IncidentReport> list = [];
  final picker = ImagePicker();
  var message;
  NewfileUpload() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://103.25.130.254/Helpdesk/Api/Incident'));
    request.fields.addAll({
      'reportname': titlecontroller.text,
      'reportdescription': descriptioncontroller.text,
      'latitude': latitudedata,
      'longitude': longitudedata,
      'locationid': globaldata.LocationID,
      'checkid': globaldata.CheckID,
      'gid': globaldata.GID,
    });
    var file = await http.MultipartFile.fromPath(' ', imageFile!.path);
    request.files.add(file);
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      print("DATA1");
      print(responseData);
      var parsedata = IncidentReport.fromJson(json.decode(responseData));
      print(parsedata.incidentTable[0].msg);
      message = parsedata.incidentTable[0].msg;
      print("message");
      print(message);
      globaldata.Message = message;
      print(globaldata.Message);
      Fluttertoast.showToast(
          msg: globaldata.Message,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 6,
          backgroundColor: Color(0xFF184f8d),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: globaldata.Message,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
//Get current location
  getCurrentlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitudedata = '${geoposition.latitude}';
      print("latitudedata");
      print(latitudedata);
      longitudedata = '${geoposition.longitude}';
    });
  }
  @override
  void initState() {
    _getStateList();
    getCurrentlocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incident Report"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.blueAccent)),
                  padding: EdgeInsets.only(left: 0, right: 15, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: _myState.isNotEmpty ? _myState : null,
                              iconSize: 50,
                              iconEnabledColor: Color(0xFF184f8d),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              hint: Text(
                                'Select Location',
                                style: TextStyle(color: Colors.black),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _myState = newValue!;
                                  _getCitiesList();
                                });
                              },
                              items: statesList.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item['LocationName']),
                                  value: item['LocationID'].toString(),
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
              Padding(padding: EdgeInsets.only(top: 10.0)),
              SizedBox(
                height: 20,
                child:  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),),
                    Text("Sub Location",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: titlecontroller,minLines: 2,
                maxLines:10 ,
                  decoration: InputDecoration(
                    hintText: "Type your text here.........",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              SizedBox(
                height: 20,
                child:  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),),
                    Text("Incident Details",style: TextStyle(fontSize: 17.0,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextFormField(
                  controller: descriptioncontroller,
                  minLines: 8,
                  maxLines: 40,
                  decoration: InputDecoration(
                    hintText: "Type your text here.........",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
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
                        onPressed: () {
                          openCamera();
                        },
                        icon: Icon(
                          Icons.cameraswitch_rounded,
                          size: 40,
                        )),
                  ),
                  imageFile != null
                      ? Container(
                          height: 80,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(imageFile!),
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
                          child: Center(
                              child: Text(
                            "Image Preview",
                            textAlign: TextAlign.center,
                          ))),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Container(
                  height: 40,
                  width: 150,
                  child: MaterialButton(
                      color: Color(0xFF184f8d),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        if (_myState.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please select location.",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (titlecontroller.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter Sublocation",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (descriptioncontroller.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please fill Observation.",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (imageFile == null) {
                          Fluttertoast.showToast(
                              msg: "Please select image.",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 6,
                              backgroundColor: Color(0xFF184f8d),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else
                        {
                          setState(() {
                            NewfileUpload();
                            titlecontroller.clear();
                            descriptioncontroller.clear();
                            _myState= "";
                            imageFile= null;



                          });
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      );

  }

  Future<void> openCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    print("ABCD");
    print(imageFile);
  }

// Get Location information by API
  List statesList = [];
  String _myState = "";
  _getStateList() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/Location'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(responseData);
      var decodedata = (jsonDecode(responseData));
      print("GetLocation");
      print(decodedata);
      var locationid = decodedata['Location'][index]["LocationID"];
      print("decodedata");
      print(locationid);
      globaldata.LocationID = locationid;
      print(globaldata.LocationID);
      setState(() {
        statesList = decodedata['Location'];
      });

      return decodedata;
    }
  }

  // Get Checkpoints information by API
  late List citiesList = [];
  late String _myCity = "";
  _getCitiesList() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/Checkpoint'));
    request.body = json.encode({"LocationID": _myState});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      var data = json.decode(responseData);
      var checkid = data['Checkpoint'][index]["CheckID"];
      globaldata.CheckID = checkid;
      setState(() {
        citiesList = data['Checkpoint'];
      });
    }
  }
}
