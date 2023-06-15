import 'package:flutter/material.dart';
import 'package:guard_patrolling/Models/patrolling%20historymodel.dart';
import 'package:guard_patrolling/PDF%20Folder/pdfexportfile.dart';
import 'package:printing/printing.dart';


class PdfPreviewPage extends StatelessWidget {
  Guardhistory? historydata;
  int index=0;
  PdfPreviewPage({Key? key, this.historydata,required this.index }) : super(key: key){
    print("#####");
    print(historydata);
  }

  @override
  Widget build(BuildContext context) {
    print("&&&&&&");
    print(historydata);
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(historydata!,index),
      ),
    );
  }
}


