import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../features/job_details/data/rx_get_report/model/job_report_response.dart';

class PdfProvider extends ChangeNotifier {
  Future<pw.ImageProvider> imagePath() async {
    final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

    return netImage;
  }

  Future<Uint8List> generateSamplePdf({
    required String fhaFormId,
    required String inspectionType,
    required String inspectionDate,
    required String subjectProperty,
    required String caseNumber,
    required List<DataImage> images,
  }) async {
    final pdf = pw.Document();

    // Logo Image
    final imageBytes = await rootBundle.load(Assets.icons.logo.path);
    final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

    // footer image
    final footerImageBytes = await rootBundle.load(
      Assets.icons.attachment.path,
    );
    final footerImage = pw.MemoryImage(footerImageBytes.buffer.asUint8List());

    // Images
    final imageBytes1 = await rootBundle.load(Assets.images.image1.path);
    final image1 = pw.MemoryImage(imageBytes1.buffer.asUint8List());

    final imageBytes2 = await rootBundle.load(Assets.images.image2.path);
    final image2 = pw.MemoryImage(imageBytes2.buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        header: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              // Logo Image
              pw.Image(image, width: 100, height: 50, fit: pw.BoxFit.contain),

              pw.Text(
                "A Div. of Lone Star Building Inspection, Inc.",
                style: pw.TextStyle(
                  fontSize: 8,
                  color: PdfColor.fromHex('#474747'),
                ),
              ),

              pw.Text(
                "Inspection Report",
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromHex('#2D8D7C'),
                ),
              ),

              pw.SizedBox(height: 5),

              pw.Text(
                "Attachment to FHA form # $fhaFormId",
                style: pw.TextStyle(
                  fontSize: 13,
                  color: PdfColor.fromHex('#474747'),
                ),
              ),

              pw.SizedBox(height: 30),

              /// Header Details
              ///
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: "Type of Inspection: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.TextSpan(
                            text: inspectionType,
                            style: pw.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),

                  pw.Expanded(
                    flex: 1,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: "Date of Inspection: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.TextSpan(
                            text: inspectionDate,
                            style: pw.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              pw.SizedBox(height: 10),

              /// Header Details => 2
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: "Subject Property: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.TextSpan(
                            text: subjectProperty,
                            style: pw.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),

                  pw.Expanded(
                    flex: 1,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                            text: "Case: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.TextSpan(
                            text: caseNumber,
                            style: pw.TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
            ],
          );
        },

        margin: pw.EdgeInsets.fromLTRB(36, 10, 36, 10),
        pageFormat: PdfPageFormat.a4,
        footer: (context) {
          return pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            crossAxisAlignment: pw.CrossAxisAlignment.start,

            children: [
              // footer left image
              pw.Image(
                footerImage,
                width: 76,
                height: 50,
                fit: pw.BoxFit.contain,
              ),

              pw.SizedBox(width: 30),

              // footer center text
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,

                  children: [
                    pw.Text(
                      "All utilities are on and tested unless otherwise noted",
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex('#353333'),
                      ),
                    ),
                    pw.Text(
                      "TREC Lic. # 10546 | TSBPE Lic. # I-3836 | Code Enforcement Lic. # 7055 | HUD-FHA Fee Reg.# D683 & 203K - D0931",
                      style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex('#000000'),
                      ),
                    ),

                    pw.SizedBox(height: 20),
                    // Page count
                    pw.Text(
                      'Page ${context.pageNumber} of ${context.pagesCount}',
                    ),
                  ],
                ),
              ),

              pw.SizedBox(width: 30),
              // footer right image
              pw.Image(
                footerImage,
                width: 76,
                height: 50,
                fit: pw.BoxFit.contain,
              ),
            ],
          );
        },
        build: (pw.Context context) => [
          pw.ListView.builder(
            itemCount: images.length,
            itemBuilder: (_, index) {
              final datum = images[index];

              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    datum.imageLabel ?? "",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),

                  pw.SizedBox(height: 10),

                  pw.Row(
                    children: [
                      // Image 1
                      pw.Expanded(
                        flex: 1,
                        child: pw.Image(
                          image1,
                          height: 200,
                          fit: pw.BoxFit.fitWidth,
                        ),
                      ),

                      pw.SizedBox(width: 16),

                      pw.Expanded(
                        flex: 1,
                        child: pw.Image(
                          image2,
                          height: 200,
                          fit: pw.BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 16),
                ],
              );
            },
          ),
        ],
      ),
    );

    return pdf.save(); // THIS IS REQUIRED
  }
}
