import 'package:flutter/material.dart';

import '../Models/Missedtime_data.dart';


class Missedrounddata extends StatefulWidget {
  Missedround? missrounddata;
   Missedrounddata({Key? key, this.missrounddata}) : super(key: key);

  @override
  State<Missedrounddata> createState() => _MissedrounddataState();
}

class _MissedrounddataState extends State<Missedrounddata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Missed Round Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.missrounddata!.schedule.length,
            itemBuilder: (BuildContext context, int index){
              return widget.missrounddata!.schedule[index].error==false?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.all(5.0),
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
                                  child: Text("Location ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Text(widget.missrounddata!.schedule[index].locationName.toString(),style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                              ),
                            ],),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                    child: Text("Schedule At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(padding: EdgeInsets.only(left: 0.0),
                                    child: Text(widget.missrounddata!.schedule[index].scheduleTime.toString(),style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                  ),),]),],
                      ),
                    ),
                  ),
                ):
              Container(
                child: Center(child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(widget.missrounddata!.schedule[index].msg.toString(),style: TextStyle(fontSize: 17.0),),
                )),
              );
            }),
      ),
    );
  }
}
