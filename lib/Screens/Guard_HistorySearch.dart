import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guard_patrolling/universaldata.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../Models/patrolling historymodel.dart';
import '../RoundHistory/Guard_Historydetails.dart';



class shiftthistory extends StatefulWidget {

  shiftthistory({Key? key,}) : super(key: key);

  @override
  State<shiftthistory> createState() => _shiftthistoryState();
}

class _shiftthistoryState extends State<shiftthistory> {
  TextEditingController fromdatecontroller = TextEditingController();
  TextEditingController todatecontroller = TextEditingController();
  String? selectedvalue;
  List<Guardhistory> list = [];
  Guardhistory? historydata;
  searchbutton(context) async {
    int index=0;
    var headers = {
      'Content-Type': 'application/json'
    };
   try{
     var request = http.Request('GET', Uri.parse('http://103.25.130.254/Helpdesk/Api/History'));
     request.body = json.encode({
       "UserId": globaldata.GID,
       "fromdt": fromdatecontroller.text,
       "todt": todatecontroller.text,
       "status": selectedvalue.toString()
     });
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     var responseData = await response.stream.bytesToString();
     if(response.statusCode == 200){
       var historyrounddata = Guardhistory.fromJson(jsonDecode(responseData));
       if(historyrounddata.schedule[index].error==false){
         Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => Historydetails(historydata: historyrounddata,)));

       } else {

         Fluttertoast.showToast(
             msg: historyrounddata.schedule[index].msg as String,
             gravity: ToastGravity.BOTTOM,
             toastLength: Toast.LENGTH_LONG,
             timeInSecForIosWeb: 3,
             backgroundColor: Color(0xFF184f8d),
             textColor: Colors.white,
             fontSize: 16.0);
       }

       return historyrounddata;
     }
     else{
       Fluttertoast.showToast(
           msg: "Data Not Found!",
           gravity: ToastGravity.BOTTOM,
           toastLength: Toast.LENGTH_LONG,
           timeInSecForIosWeb: 3,
           backgroundColor: Color(0xFF184f8d),
           textColor: Colors.white,
           fontSize: 16.0);
     }
   }
   catch (e){

     Fluttertoast.showToast(
         msg: "Data Not Found!",
         gravity: ToastGravity.BOTTOM,
         toastLength: Toast.LENGTH_LONG,
         timeInSecForIosWeb: 5,
         backgroundColor: Color(0xFF184f8d),
         textColor: Colors.white,
         fontSize: 16.0);
   }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Round History"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: SizedBox(
                        height: 40,
                        width: 165,
                        child: TextField(
                        controller: fromdatecontroller,
                        readOnly: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                            hintText: "From date",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(5.0),
                              ),
                            ),
                          suffixIcon: Icon(Icons.calendar_month,color: Color(0xFF184f8d),size: 20,)
                            ),
                          onTap: ()
                          async {
                          DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2023), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );
                          if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                fromdatecontroller.text = formattedDate; //set output date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }

                          },
                        ),
                      ),
                    ),
                    ),
                  Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SizedBox(
                          height: 40,
                          width: 167,
                          child: TextField(
                            controller: todatecontroller,
                            readOnly: true,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                                hintText: " To date",
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.calendar_month,color: Color(0xFF184f8d),size: 20,)
                            ),
                            onTap: ()async{
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2023), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );
                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  todatecontroller.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                                print("Date is not selected");
                              }

                            },
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RadioListTile(
                    title: Text("Visited",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    value: "2",
                    groupValue: selectedvalue,
                    onChanged: (value) {
                      setState(() {
                        selectedvalue = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RadioListTile(
                    title: Text("Missed",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    value: "3",
                    groupValue: selectedvalue,
                    onChanged: (value) {
                      setState(() {
                        selectedvalue = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.only(top: 15.0)),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color(0xFF184f8d)),
              ),
              child: Text(
                'Search',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () async {
                if(fromdatecontroller.text.isEmpty){
                  Fluttertoast.showToast(
                      msg: "Please select from date",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Color(0xFF184f8d),
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if(todatecontroller.text.isEmpty){
                  Fluttertoast.showToast(
                      msg: "Please select to date",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Color(0xFF184f8d),
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else if(selectedvalue==null){
                  Fluttertoast.showToast(
                      msg: "Please Activity type",
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Color(0xFF184f8d),
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                // else if(todatecontroller.text.compareTo(fromdatecontroller.text)>=0){
                //   Fluttertoast.showToast(
                //       msg: "Please Select Correct Date.",
                //       gravity: ToastGravity.BOTTOM,
                //       toastLength: Toast.LENGTH_SHORT,
                //       timeInSecForIosWeb: 2,
                //       backgroundColor: Color(0xFF184f8d),
                //       textColor: Colors.white,
                //       fontSize: 16.0);
                // }
                else {
                 historydata= await searchbutton(context);
                 fromdatecontroller.clear();
                 todatecontroller.clear();
                 selectedvalue=null;
                }
              }),
        ],
      ),
    );
  }
}
