import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../Models/Incident_History.dart';


Future<Uint8List> incidentPdf(IncidentHistory incidentdata,int inde) async {
  int index=inde;
  final netImage = await networkImage(incidentdata.data[index].photoUrl);
  final pdf = pw.Document();
  final newfont = await PdfGoogleFonts.sanchezRegular();
  pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(children: [
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('Incident Report', style: pw.TextStyle(font: newfont,fontSize: 25,color: PdfColors.black),)
            ]
        ),
        pw.Padding(padding:pw.EdgeInsets.only(top: 10.0), ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Name :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].gidName,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Date :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].date,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Time :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].time,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Location :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].locationName,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Sublocation :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].subLocation,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Incident Details :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
              pw.Text(
                incidentdata.data[index].incidentDetails,
                style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                textAlign: pw.TextAlign.center,
              ),
            ]
        ),
        pw.Padding(padding:pw.EdgeInsets.only(top: 20.0), ),
        pw.Row(
            mainAxisAlignment:pw.MainAxisAlignment.start,
            children: [
              pw.Container(
                height: 300,
                width: 300,
                child: pw.Image(netImage),
              )
            ]
        )

      ])));
  return pdf.save();
}
