import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({ 
    super.key, 
    required this.title, 
    required this.pdfPath 
  });

  final String title;
  final String pdfPath;

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Theme(
        data: ThemeData.from(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            brightness: Brightness.dark
          ),
        ), 
        child: SfPdfViewer.network(
          pdfPath,
        )
      )
    );
  }
}