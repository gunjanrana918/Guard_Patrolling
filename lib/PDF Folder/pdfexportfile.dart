
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../Models/patrolling historymodel.dart';
import 'package:http/http.dart'as http;

Future<Uint8List> makePdf(Guardhistory historydata,int inde) async {
  int index=inde;
  final netImage = await networkImage(historydata.schedule[index].photoUrl);
  print('data');
  print(netImage);
  final pdf = pw.Document();
  final newfont = await PdfGoogleFonts.sanchezRegular();
  pdf.addPage(
      pw.MultiPage(
          margin: pw.EdgeInsets.all(20),
    pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
      return <pw.Widget>[
        pw.Column(children: [
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text('Schedule Report', style: pw.TextStyle(font: newfont,fontSize: 25,color: PdfColors.black),)
              ]
          ),
          pw.Padding(padding:pw.EdgeInsets.only(top: 10.0), ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text('Name :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
                pw.Text(
                  historydata.schedule[index].name as String,
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
                  historydata.schedule[index].scheduleToDate as String,
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
                  historydata.schedule[index].scheduleTime as String,
                  style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                  textAlign: pw.TextAlign.center,
                ),
              ]
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text('Status :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
                pw.Text(
                  historydata.schedule[index].status as String,
                  style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                  textAlign: pw.TextAlign.center,
                ),
              ]
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text('Shift :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
                pw.Text(
                  historydata.schedule[index].shift as String,
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
                  historydata.schedule[index].locationName,
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
                  historydata.schedule[index].checkPointName,
                  style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                  textAlign: pw.TextAlign.center,
                ),
              ]
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text('Observation Report :'  " ", style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),),
                pw.Text(
                  historydata.schedule[index].reportDescription,
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
        ])
      ];
          }

      )
  );
  return pdf.save();
}
