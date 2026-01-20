import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import '../../provider/pdf_provider.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final provider = context.read<PdfProvider>();

            await Printing.layoutPdf(
              onLayout: (format) async => provider.generateSamplePdf(fhaFormId: '92051'),
            );
          },
          child: const Text('Generate PDF'),
        ),
      ),
    );
  }
}
