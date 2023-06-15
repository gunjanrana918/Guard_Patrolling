import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../Models/patrolling historymodel.dart';

Future<Uint8List> makePdf(Guardhistory historydata) async {
  int index=0;
  // final font = await rootBundle.load("Font/OpenSans-VariableFont_wdth,wght.ttf");
  // final ttf = Font.ttf(font);
  final pdf = pw.Document();
  final newfont = await PdfGoogleFonts.nunitoExtraLight();
  pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Column(children: [
            pw.Table(
                border: pw.TableBorder.all(color: PdfColors.black),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Expanded(
                        child: pw.Text(
                          'Schedule Report',
                          style: pw.TextStyle(font: newfont,fontSize: 20,color: PdfColors.black),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Text(
                          historydata.schedule[index].locationName,
                          style: pw.TextStyle(font: newfont,fontSize: 20.0,color: PdfColors.black),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // The remaining rows contain each item from the invoice, and uses the
                  // map operator (the ...) to include these items in the list
                  // ...historydata!.schedule.map((e) {
                  //   return (e.error == false)
                  //       ? pw.TableRow(
                  //           children: [
                  //             pw.Expanded(
                  //               child: Text("e.locationName",
                  //                   style: TextStyle(font: newfont)),
                  //               flex: 2,
                  //             ),
                  //             pw.Expanded(
                  //               child: Text("e.checkPointName",
                  //                   style: TextStyle(font: newfont)),
                  //               flex: 1,
                  //             )
                  //           ],
                  //         )
                  //       : pw.TableRow(children: []);
                  // }),
                ])
          ])));
  return pdf.save();
}
