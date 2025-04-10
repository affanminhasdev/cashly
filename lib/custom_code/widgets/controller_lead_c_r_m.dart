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

class ControllerLeadCRM extends StatefulWidget {
  const ControllerLeadCRM({
    super.key,
    this.width,
    this.height,
    this.callback,
    this.lead,
  });

  final double? width;
  final double? height;
  final Future Function()? callback;
  final LeadRow? lead;

  @override
  State<ControllerLeadCRM> createState() => _ControllerLeadCRMState();
}

class _ControllerLeadCRMState extends State<ControllerLeadCRM> {
  LeadRow? _currentLead;

  @override
  void initState() {
    super.initState();
    _currentLead = widget.lead;
  }

  @override
  void didUpdateWidget(covariant ControllerLeadCRM oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Verifica se o lead mudou
    if (widget.lead != oldWidget.lead) {
      setState(() {
        _currentLead = widget.lead;
      });

      // Deferir o callback para evitar conflitos com o ciclo de reconstrução
      if (widget.callback != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.callback!();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
