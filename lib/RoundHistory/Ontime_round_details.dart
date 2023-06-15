import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/OnTime_round.dart';

class Ontimerounddata extends StatefulWidget {

  Ontimeround? ontimedata;
  Ontimerounddata({Key? key, this.ontimedata}) : super(key: key);
  @override
  State<Ontimerounddata> createState() => _OntimerounddataState();
}

class _OntimerounddataState extends State<Ontimerounddata> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ontime Round Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.ontimedata!.schedule.length,
            itemBuilder: (BuildContext context, int index){
                return widget.ontimedata!.schedule[index].error==false?
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 130,
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
                                  child: Text("Location ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Text(widget.ontimedata!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                              ),
                            ],),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                    child: Text("Checkpoint",
                                      style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                              ),
                              Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                  child: Text(widget.ontimedata!.schedule[index].checkPointName,
                                    style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)
                            ],
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
                                Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.ontimedata!.schedule[index].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),
                                ),
                              ]),
                          Padding(padding: EdgeInsets.only(top: 5.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Complete At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(child: Padding(padding: EdgeInsets.only(left: 0.0),
                                child: Text(widget.ontimedata!.schedule[index].cTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ):
                Container(
                  child: Center(child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(widget.ontimedata!.schedule[index].msg,style: TextStyle(fontSize: 17.0),),
                  )),
                );
            }),
      ),
    );
  }
}
