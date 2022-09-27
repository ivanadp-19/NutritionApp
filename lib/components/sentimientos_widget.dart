import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentimientosWidget extends StatefulWidget {
  const SentimientosWidget({Key key}) : super(key: key);

  @override
  _SentimientosWidgetState createState() => _SentimientosWidgetState();
}

class _SentimientosWidgetState extends State<SentimientosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/Drinking_tea-pana_(1).png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text(
            'Esto esta muy vacio. Vamos a intentar llenarlo',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
