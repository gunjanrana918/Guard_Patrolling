
import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/patrolling%20historymodel.dart';
import '../PDF Folder/PDFpreview.dart';


class AdminHistorydetails extends StatefulWidget {
  Guardhistory? historydata;
  AdminHistorydetails({Key? key, this.historydata,}) : super(key: key);
  @override
  State<AdminHistorydetails> createState() => _AdminHistorydetailsState(historydata);
}

class _AdminHistorydetailsState extends State<AdminHistorydetails> {
  Guardhistory? newhistory;
  _AdminHistorydetailsState(newhistory){
    print("object");
    print(newhistory);
    this.newhistory=newhistory;
  }
  List<Guardhistory> list = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Details"),
        backgroundColor: Color(0xFF184f8d),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.historydata!.schedule.length,
            itemBuilder: (BuildContext context, int index0){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 200,
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: InkWell(
                                child: Icon(Icons.file_download_outlined,size: 30,color: Colors.black,),
                                onTap: (){
                                  print(newhistory);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PdfPreviewPage(historydata: newhistory,index:index0)));
                                },

                              ),
                            )
                          ],),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Schedule Id",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.historydata!.schedule[index0].scheduleId,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),]),
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
                                  child: Text(widget.historydata!.schedule[index0].scheduleToDate,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Complete At",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                                ),
                              ),
                              Expanded(
                                child: Padding(padding: EdgeInsets.only(left: 0.0),
                                  child: Text(widget.historydata!.schedule[index0].completeTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),]),
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
                                  child: Text(widget.historydata!.schedule[index0].scheduleTime,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                                ),),]),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("Location ",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            Expanded(
                              child: Text(widget.historydata!.schedule[index0].locationName,style: TextStyle(color: Color(0xFF184f8d),fontSize: 16.0,  ),),
                            ),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(padding: EdgeInsets.only(top: 5.0,left: 8.0),
                                  child: Text("Checkpoint ",
                                    style: TextStyle(color: Colors.black,fontSize: 17.0,  fontWeight: FontWeight.bold ),)),
                            ),
                            Expanded(child:  Padding(padding: EdgeInsets.only(top: 5.0,left: 0.0),
                                child: Text(widget.historydata!.schedule[index0].checkPointName,
                                  style: TextStyle(color: Color(0xFF184f8d),fontSize: 17.0, ),)),)
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
  //wideget for formatting////
  Widget PaddedText(
      final String text, {
        final TextAlign align = TextAlign.left,
      }) =>
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          textAlign: align,
        ),
      );

}

