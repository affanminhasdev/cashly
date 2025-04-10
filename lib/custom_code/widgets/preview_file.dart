// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_pdfview/flutter_pdfview.dart'; // Para visualizar PDFs
import 'package:url_launcher/url_launcher.dart'; // Para links externos
import 'dart:convert';

class PreviewFile extends StatefulWidget {
  const PreviewFile({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;

  @override
  State<PreviewFile> createState() => _PreviewFileState();
}

class _PreviewFileState extends State<PreviewFile> {
  bool _isImageFile(String url) {
    final ext = url.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(ext);
  }

  bool _isPdfFile(String url) {
    return url.toLowerCase().endsWith('.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: _isImageFile(widget.url)
          ? Image.network(
              widget.url,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  _unsupportedFileWidget(),
            )
          : _isPdfFile(widget.url)
              ? PDFView(
                  filePath: widget.url,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  onError: (error) {
                    print("Error loading PDF: $error");
                  },
                )
              : _unsupportedFileWidget(),
    );
  }

  Widget _unsupportedFileWidget() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (await canLaunch(widget.url)) {
            await launch(widget.url);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not open file')),
            );
          }
        },
        child: Text('Abrir arquivo'),
      ),
    );
  }
}
