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

import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:linkify/linkify.dart'; // Pacote para detectar links no texto

class LinkText extends StatefulWidget {
  const LinkText({
    super.key,
    this.width,
    this.height,
    required this.texto,
  });

  final double? width;
  final double? height;
  final String texto;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    final links = linkify(widget.texto); // Detecta links no texto

    return Container(
      width: widget.width,
      constraints: BoxConstraints(
        minHeight: 0,
        maxHeight: double.infinity,
      ),
      padding: EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          children: links.map((element) {
            if (element is LinkableElement) {
              return TextSpan(
                text: element.text,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Ubuntu',
                      color: Colors.blue,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      useGoogleFonts: false,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final Uri url = Uri.parse(element.url);
                    await launchUrl(url);
                  },
              );
            } else {
              return TextSpan(
                text: element.text,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
