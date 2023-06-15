import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../Models/Incident_History.dart';
import 'Incidentpdfexport.dart';


class IncidentPdfPreviewPage extends StatelessWidget {
  IncidentHistory? incidentdata;
  int index=0;
  IncidentPdfPreviewPage({Key? key, this.incidentdata,required this.index }) : super(key: key){
    print("#####");
    print(incidentdata);
  }

  @override
  Widget build(BuildContext context) {
    print("&&&&&&");
    print(incidentdata);
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => incidentPdf(incidentdata!,index),
      ),
    );
  }
}


