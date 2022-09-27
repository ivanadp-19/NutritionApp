import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dietaspasadas/dietaspasadas_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DietaWidget extends StatefulWidget {
  const DietaWidget({Key key}) : super(key: key);

  @override
  _DietaWidgetState createState() => _DietaWidgetState();
}

class _DietaWidgetState extends State<DietaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'dieta'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DietasRecord>>(
      stream: queryDietasRecord(
        parent: currentUserReference,
        queryBuilder: (dietasRecord) =>
            dietasRecord.orderBy('created_at', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<DietasRecord> dietaDietasRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final dietaDietasRecord = dietaDietasRecordList.isNotEmpty
            ? dietaDietasRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF84AFBF),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('DIETA_PAGE_arrow_back_rounded_ICN_ON_TAP');
                logFirebaseEvent('IconButton_Navigate-To');
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeWidget(),
                  ),
                );
              },
            ),
            title: Text(
              'Dieta más reciente',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 19,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.access_time,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('DIETA_PAGE_access_time_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_Navigate-To');
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DietaspasadasWidget(),
                    ),
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              logFirebaseEvent('DIETA_FloatingActionButton_3qndm1j3_ON_T');
              logFirebaseEvent('FloatingActionButton_Launch-U-R-L');
              await launchURL(dietaDietasRecord.dietaUrl);
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            icon: FaIcon(
              FontAwesomeIcons.arrowDown,
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
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterFlowPdfViewer(
                      networkPath: dietaDietasRecord.dietaUrl,
                      height: MediaQuery.of(context).size.height * 0.7,
                      horizontalScroll: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
