import '../dietaspasadas/dietaspasadas_widget.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietaPasadaWidget extends StatefulWidget {
  const DietaPasadaWidget({
    Key key,
    this.dietaUrls,
    this.tiempo,
  }) : super(key: key);

  final String dietaUrls;
  final DateTime tiempo;

  @override
  _DietaPasadaWidgetState createState() => _DietaPasadaWidgetState();
}

class _DietaPasadaWidgetState extends State<DietaPasadaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'DietaPasada'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('DIETA_PASADA_PAGE_Icon_6vugcqz8_ON_TAP');
            logFirebaseEvent('Icon_Navigate-To');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DietaspasadasWidget(),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 32,
          ),
        ),
        title: Text(
          dateTimeFormat('d/M H:mm', widget.tiempo),
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('DIETA_PASADA_FloatingActionButton_ymsf8s');
          logFirebaseEvent('FloatingActionButton_Launch-U-R-L');
          await launchURL(widget.dietaUrls);
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: Icon(
          Icons.download_sharp,
        ),
        elevation: 8,
        label: Text(
          'Descargar',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
        ),
      ),
      body: SafeArea(
        child: FlutterFlowPdfViewer(
          networkPath: widget.dietaUrls,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
