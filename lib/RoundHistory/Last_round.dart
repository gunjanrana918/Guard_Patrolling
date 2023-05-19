import 'package:flutter/material.dart';

import '../Models/LastRoundmodel.dart';

class Lastround extends StatefulWidget {
  LastRound? lastdata;
  Lastround({Key? key, this.lastdata}) : super(key: key);

  @override
  State<Lastround> createState() => _LastroundState();
}

class _LastroundState extends State<Lastround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Round Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.lastdata!.schedule.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.all(4.0),
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
                            child: Padding(padding: EdgeInsets.only(left: 8.0,top: 5.0),
                              child: Text("Checkpoint Name",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                            ),
                          ),
                          Expanded(
                            child: Expanded(
                              child: Text(widget.lastdata!.schedule[index].checkPointName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                            ),
                          )
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
                          Expanded(child: Text(widget.lastdata!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),)],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Schedule at",
                                  style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                          ),
                          Expanded(child:   Text(widget.lastdata!.schedule[index].scheduleTime,
                            style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),),)],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Shift",
                                  style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                          ),
                          Expanded(
                            child: Text(widget.lastdata!.schedule[index].shift,
                            style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),),)

                        ],
                      ),

                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
