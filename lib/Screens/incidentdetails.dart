import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/Incident_History.dart';

class detailsview extends StatefulWidget {
  IncidentHistory? incidentdata;
  detailsview({super.key, this.incidentdata});

  @override
  State<detailsview> createState() => _detailsviewState();
}
int index = 0;
class _detailsviewState extends State<detailsview> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Incident History Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.incidentdata!.data.length,
            itemBuilder: (BuildContext context, int index){
              print("helooooo");
              print(widget.incidentdata!.data.length);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 160,
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
                              child: Text(widget.incidentdata!.data[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                            ),
                          ],),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Sublocation",
                                    style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                            ),
                            Expanded(
                              child:  Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                  child: Text(widget.incidentdata!.data[index].subLocation,
                                    style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 10.0),
                                  child: Text("Date",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.incidentdata!.data[index].date,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),
                            ]),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 10.0),
                                    child: Text("Time",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.incidentdata!.data[index].time,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),
                            ]),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Details",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.incidentdata!.data[index].incidentDetails,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),
                            ]),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

