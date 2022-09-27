import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecetasWidget extends StatefulWidget {
  const RecetasWidget({Key key}) : super(key: key);

  @override
  _RecetasWidgetState createState() => _RecetasWidgetState();
}

class _RecetasWidgetState extends State<RecetasWidget> {
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
            'No hay recetas aún',
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
