import 'package:flutter/material.dart';
import 'package:guard_patrolling/Screens/pdfexportfile.dart';
import 'package:pdf/pdf.dart';
import 'package:guard_patrolling/Models/patrolling%20historymodel.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../RoundHistory/Guard_Historydetails.dart';

class PdfPreviewPage extends StatelessWidget {
  Guardhistory? historydata;

  PdfPreviewPage({Key? key, this.historydata,}) : super(key: key){
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
        build: (context) => makePdf(historydata!),
      ),
    );
  }
}


