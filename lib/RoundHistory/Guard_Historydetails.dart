import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/patrolling%20historymodel.dart';
import 'package:readmore/readmore.dart';

class Historydetails extends StatefulWidget {
  Guardhistory? historydata;
  Historydetails({
    Key? key,
    this.historydata,
  }) : super(key: key);
  @override
  State<Historydetails> createState() => _HistorydetailsState();
}

class _HistorydetailsState extends State<Historydetails> {
  Guardhistory? newhistory;
  List<Guardhistory> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History Details"),
          backgroundColor: Color(0xFF184f8d),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.historydata!.schedule.length,
              itemBuilder: (BuildContext context, int index0) {
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
                    title:
                        Text(widget.historydata!.schedule[index0].reportdate,style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.w500 )),
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Schedule At : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.historydata!.schedule[index0].scheduleTime as String,
                            style: TextStyle(
                              color: Color(0xFF184f8d),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Complete At : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.historydata!.schedule[index0].completeTime,
                            style: TextStyle(
                              color: Color(0xFF184f8d),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Location : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.historydata!.schedule[index0].locationName,
                            style: TextStyle(
                              color: Color(0xFF184f8d),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "CheckPoint : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.historydata!.schedule[index0].checkPointName,
                            style: TextStyle(
                              color: Color(0xFF184f8d),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "UncheckPoint : ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.historydata!.schedule[index0].uncheckPointName,
                            style: TextStyle(
                              color: Color(0xFF184f8d),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 8.0),
                            child: Text("Observation : ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                          ),
                          Expanded(
                            child: ReadMoreText(widget.historydata!.schedule[index0].reportDescription,
                              style: TextStyle(fontSize: 16,color: Color(0xFF184f8d)),
                              trimLines: 2,
                              colorClickableText: Colors.blue,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Length,
                              trimCollapsedText: '.....Show more',
                              trimExpandedText: '.....Show less',
                              lessStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                              moreStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )

            ));
  }

}
