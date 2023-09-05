import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/Incident_History.dart';
import 'package:readmore/readmore.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ListView.builder(
            itemCount: widget.incidentdata!.data.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                width: MediaQuery.of(context).size.width - 10,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5)
                  ],
                ),
                child: ExpansionTile(
                  title: Text(widget.incidentdata!.data[index].date,style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold  ),) ,
                  children:[
                    Column(
                      children: [
                        Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Time : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                              Text(widget.incidentdata!.data[index].time,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                            ]),
                        Padding(padding: EdgeInsets.only(top: 5.0)),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Location : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                            ),
                            Text(widget.incidentdata!.data[index].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                          ],),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Sublocation : ",
                                  style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                            Text(widget.incidentdata!.data[index].subLocation,
                              style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)
                          ],
                        ),
                        Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8.0),
                                child: Text("Details : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                              Expanded(
                                child:
                                ReadMoreText(widget.incidentdata!.data[index].incidentDetails,
                                  style: TextStyle(fontSize: 16,color: Color(0xFF184f8d)),
                                  trimLines: 1,
                                  colorClickableText: Colors.blue,
                                  textAlign: TextAlign.justify,
                                  trimMode: TrimMode.Length,
                                  trimCollapsedText: '.....Show more',
                                  trimExpandedText: '.....Show less',
                                  lessStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                  moreStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ],
                    ),
                 ] ),
                );

            }),
      ),
    );
  }
}

