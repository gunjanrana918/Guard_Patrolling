import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/Incident_History.dart';
import 'package:readmore/readmore.dart';

import '../PDF Folder/Incidentpdf_view.dart';

class Admindetailsview extends StatefulWidget {
  IncidentHistory? incidentdata;
  Admindetailsview({super.key, this.incidentdata});

  @override
  State<Admindetailsview> createState() => _AdmindetailsviewState(incidentdata);
}
int index = 0;
class _AdmindetailsviewState extends State<Admindetailsview> {
  IncidentHistory? newincident;
  _AdmindetailsviewState(newincident){
    print(newincident);
    this.newincident=newincident;
  }

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
            itemBuilder: (BuildContext context, int index0){
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
                  title: Text(widget.incidentdata!.data[index0].date,style: TextStyle(color: Colors.black,fontSize: 16.0,  ),),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: InkWell(
                                child: Icon(Icons.file_download_outlined,size: 30,color: Colors.black,),
                                onTap: (){
                                  print(newincident);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IncidentPdfPreviewPage(incidentdata: newincident,index:index0)));
                                },

                              ),
                            )
                          ],),
                        Row(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 5.0,left: 10.0),
                                child: Text("Date : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                              Text(widget.incidentdata!.data[index0].date,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                            ]),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Location : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                            ),
                            Text(widget.incidentdata!.data[index0].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                          ],),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                child: Text("Sublocation : ",
                                  style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                            Text(widget.incidentdata!.data[index0].subLocation,
                              style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)
                          ],
                        ),
                        Row(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                child: Text("Details : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                              Expanded(
                                child: ReadMoreText(widget.incidentdata!.data[index].incidentDetails,
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
                  ]

                ),
              );
            }),
      ),
    );
  }
}

