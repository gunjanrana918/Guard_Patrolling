import 'package:flutter/material.dart';

import '../Models/DayHistory_Round.dart';
import '../Models/Night_Roundhistory.dart';

class shiftthistory extends StatefulWidget {
  DayHistory? rounddata;
  NightHistory? nightnewdata;
   shiftthistory({Key? key, this.rounddata,this.nightnewdata}) : super(key: key);

  @override
  State<shiftthistory> createState() => _shiftthistoryState();
}

class _shiftthistoryState extends State<shiftthistory> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2,
          child: Scaffold(
           appBar: AppBar(
             toolbarHeight: 10,
             backgroundColor:  Color(0xFF184f8d),
             bottom: TabBar(
               labelColor: Colors.white,
               indicatorColor: Colors.white,
                 unselectedLabelColor: Colors.limeAccent,
                 labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
                 tabs: [
                   Tab( icon:Icon(Icons.settings_system_daydream_outlined,size: 30,),text: "Day",),
                   Tab( icon:Icon(Icons.nights_stay_outlined,size: 30,),text: "Night")
                 ]),
           ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    child: ListView.builder(
                        itemCount: widget.rounddata!.schedule.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 110,
                              child: Card(
                                margin: EdgeInsets.all(3.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Color(0xFF184f8d))),
                                shadowColor: Color(0xFF184f8d),
                                elevation: 3.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Checkpoint Name",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(widget.rounddata!.schedule[index].reportCheckPoint,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                          ),
                                        ],),


                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                              child: Text("Schedule At",
                                                style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                        ),
                                        Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                            child: Text(widget.rounddata!.schedule[index].scheduleTime,
                                              style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)

                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                          ),
                                        ),
                                        Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                          child: Text(widget.rounddata!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                        ),)],
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    child: ListView.builder(
                        itemCount: widget.nightnewdata!.schedule.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 110,
                              child: Card(
                                margin: EdgeInsets.all(3.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Color(0xFF184f8d))),
                                shadowColor: Color(0xFF184f8d),
                                elevation: 3.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Expanded(
                                              child: Text("Checkpoint Name",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                            ),
                                          ),
                                        ),
                                       Expanded(
                                            child: Text(widget.nightnewdata!.schedule[index].reportCheckPoint,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                          ),
                                       ] ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                              child: Text("Schedule At",
                                                style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                        ),
                                        Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                            child: Text(widget.nightnewdata!.schedule[index].scheduleTime,
                                              style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)],
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 5.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                          ),
                                        ),
                                        Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                          child: Text(widget.nightnewdata!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                        ),)
                                      ],),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ]
              ,  ),
          )),
    );
  }
}




