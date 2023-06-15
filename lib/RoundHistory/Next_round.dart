import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/NextRound.dart';

class Nextround extends StatefulWidget {
  NextRound? nextdata;
  Nextround({Key? key, this.nextdata}) : super(key: key);

  @override
  State<Nextround> createState() => _NextroundState();
}

class _NextroundState extends State<Nextround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Round Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.nextdata!.schedule.length,
            itemBuilder: (BuildContext context, int index){
              return widget.nextdata!.schedule[index].error==false?
                Padding(
                padding: const EdgeInsets.all(10.0),
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
                        Padding(padding: EdgeInsets.only(top: 0.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Schedule At",
                                    style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                            ),
                            Expanded(
                              child: Text(widget.nextdata!.schedule[index].scheduleTime,
                                style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),),
                            ),
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
                            Expanded(child: Text(widget.nextdata!.schedule[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),)

                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Shift",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            Expanded(child: Text(widget.nextdata!.schedule[index].shift,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),)],
                        ),

                      ],

                    ),
                  ),
                ),
              ):
              Container(
                child: Center(child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(widget.nextdata!.schedule[index].msg.toString(),style: TextStyle(fontSize: 17.0),),
                )),
              );
            }),
      ),
    );
  }
}
