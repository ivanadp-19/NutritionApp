import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetaWidget extends StatefulWidget {
  const MetaWidget({Key key}) : super(key: key);

  @override
  _MetaWidgetState createState() => _MetaWidgetState();
}

class _MetaWidgetState extends State<MetaWidget> {
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
            'Aún sin metas.',
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
