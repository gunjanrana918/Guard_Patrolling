import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guard_patrolling/Models/Complete%20Day%20Round.dart';

import '../Models/Complete Night Round.dart';

class Completeround extends StatefulWidget {
  CompleteDayRound? CDAYROUND;
  CompleteNightRound? CNIGHTROUND;
   Completeround({Key? key, this.CDAYROUND,this.CNIGHTROUND}) : super(key: key);

  @override
  State<Completeround> createState() => _CompleteroundState();
}

class _CompleteroundState extends State<Completeround> {
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
                    itemCount: widget.CDAYROUND!.schedule.length,
                    itemBuilder: (BuildContext context, int index){
                       return widget.CDAYROUND!.schedule[index].error==false?
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 160,
                            child: Card(
                              margin: EdgeInsets.all(10.0),
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
                                        flex:1,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 13.0),
                                          child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.CDAYROUND!.schedule[index].locationName,softWrap:true,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0),),
                                      ),
                                    ],),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex:1,
                                        child: Padding(padding: EdgeInsets.only(top: 5.0,left: 12.0),
                                            child: Text("Checkpoint",
                                              style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                      ),
                                      Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                          child: Text(widget.CDAYROUND!.schedule[index].checkPointName,
                                            style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)
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
                                      Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                        child: Text(widget.CDAYROUND!.schedule[index].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                      ),)],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex:1,
                                        child: Padding(padding: EdgeInsets.only(top: 5.0,left: 12.0),
                                          child: Text("Complete At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                        ),
                                      ),
                                      Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                        child: Text(widget.CDAYROUND!.schedule[index].cTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                      ),)],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ):Container();
                    }),
                // Text("hello"),
                ListView.builder(
                    itemCount: widget.CNIGHTROUND?.schedule.length,
                    itemBuilder: (BuildContext context, int index){
                        return
                          widget.CNIGHTROUND?.schedule[index].error==false?
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 130,
                            child: Card(
                              margin: EdgeInsets.all(10.0),
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
                                              child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(widget.CNIGHTROUND!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                        ),
                                      ] ),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                            child: Text("Checkpoint",
                                              style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                                      ),
                                      Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                          child: Text(widget.CNIGHTROUND!.schedule[index].checkPointName,softWrap: true,
                                            style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(padding: EdgeInsets.only(left: 8.0,top: 5.0),
                                          child: Text("Schedule At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                        ),
                                      ),
                                      Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0),
                                        child: Text(widget.CNIGHTROUND!.schedule[index].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                      ),)
                                    ],),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(padding: EdgeInsets.only(left: 8.0,top: 5.0),
                                          child: Text("Complete At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                        ),
                                      ),
                                      Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0),
                                        child: Text(widget.CNIGHTROUND!.schedule[index].cTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                      ),)
                                    ],),
                                ],
                              ),
                            ),
                          ),
                        ): Container(
                            child: Center(child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Text(widget.CNIGHTROUND!.schedule[index].msg,style: TextStyle(fontSize: 17.0),),
                            )),
                          );

                    }),
              ]
              ,  ),
          )),
    );
  }
}
