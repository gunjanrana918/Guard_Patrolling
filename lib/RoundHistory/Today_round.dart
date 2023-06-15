import 'package:flutter/material.dart';
import '../Models/DaySchedulemodel.dart';
import '../Models/NightSchedulemodel.dart';

class Todayround extends StatefulWidget {
  DayRound? dayround;
  NightRound?  nightround;
  Todayround({Key? key, this.dayround,this.nightround}) : super(key: key);

  @override
  State<Todayround> createState() => _TodayroundState();
}

class _TodayroundState extends State<Todayround> {
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
                  labelColor: Colors.limeAccent,
                  indicatorColor: Colors.limeAccent,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
                  tabs: [
                    Tab( text: "Day",),
                    Tab( text: "Night")
                  ]),
            ),
            body: TabBarView(
              //physics: NeverScrollableScrollPhysics(),
              children:[
                ListView.builder(
                    itemCount: widget.dayround!.schedule.length,
                    itemBuilder: (BuildContext context, int index){
                      return widget.dayround!.schedule[index].error==false?
                      Container(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 12.0),
                                        child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(widget.dayround!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                    )
                                  ],),
                                Padding(padding: EdgeInsets.only(top: 5.0,)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex:1,
                                      child: Padding(padding: EdgeInsets.only(top: 5.0,left: 12.0),
                                          child: Text("Checkpoint",
                                            style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                    ),
                                    Expanded(child:  Text(widget.dayround!.schedule[index].checkPointName,softWrap: true,
                                      style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),))

                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex:1,
                                      child: Padding(padding: EdgeInsets.only(top: 5.0,left: 12.0),
                                        child: Text("Schedule At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                      ),
                                    ),
                                    Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0),
                                      child: Text(widget.dayround!.schedule[index].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                    ),)
                                   ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ):Text("Data not found");
                    }),
                ListView.builder(
                    itemCount: widget.nightround?.schedule.length,
                    itemBuilder: (BuildContext context, int index){
                      return widget.nightround?.schedule[index].error==false?
                      Container(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                        child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(widget.nightround!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                    ),
                                  ],),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                          child: Text("Checkpoint",
                                            style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                    ),
                                    Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0,),
                                        child: Text(widget.nightround!.schedule[index].checkPointName,
                                          style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)],
                                ),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                        child: Text("Schedule At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                      ),
                                    ),
                                    Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0),
                                      child: Text(widget.nightround!.schedule[index].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                    ),)],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ):Container(
                        child: Center(child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(widget.nightround!.schedule[index].msg,style: TextStyle(fontSize: 17.0),),
                        )),
                      );
                    }),
              ],  ),
          )),
    );
  }
}







