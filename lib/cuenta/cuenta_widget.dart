import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../signin/signin_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CuentaWidget extends StatefulWidget {
  const CuentaWidget({
    Key key,
    this.uid,
  }) : super(key: key);

  final String uid;

  @override
  _CuentaWidgetState createState() => _CuentaWidgetState();
}

class _CuentaWidgetState extends State<CuentaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cuenta'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('uid', isEqualTo: widget.uid),
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
        List<UsersRecord> cuentaUsersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final cuentaUsersRecord = cuentaUsersRecordList.isNotEmpty
            ? cuentaUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('CUENTA_arrow_back_rounded_ICN_ON_TAP');
                logFirebaseEvent('IconButton_Navigate-Back');
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Mi progreso',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: AuthUserStreamWidget(
                                    child: Text(
                                      currentUserDisplayName,
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      currentUserEmail,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Text(
                          'Estadisticas',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                      StreamBuilder<List<UserDataRecord>>(
                        stream: queryUserDataRecord(
                          parent: cuentaUsersRecord.reference,
                          queryBuilder: (userDataRecord) => userDataRecord
                              .orderBy('NumCIta', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UserDataRecord> containerUserDataRecordList =
                              snapshot.data;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                              child: GridView(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 300,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: containerUserDataRecordList
                                              .map((d) => d.numCIta)
                                              .toList(),
                                          yData: containerUserDataRecordList
                                              .map((d) => d.musculo)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: Color(0xFFA096B3),
                                            barWidth: 3,
                                          ),
                                        )
                                      ],
                                      backgroundColor: Colors.white,
                                      axisBounds: AxisBounds(),
                                      xAxisLabelInfo: AxisLabelInfo(
                                        title: 'Citas',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .subtitle1,
                                      ),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        title: '% de musculo',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 300,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: containerUserDataRecordList
                                              .map((d) => d.numCIta)
                                              .toList(),
                                          yData: containerUserDataRecordList
                                              .map((d) => d.peso)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: Color(0xFFA096B3),
                                            barWidth: 3,
                                          ),
                                        )
                                      ],
                                      backgroundColor: Colors.white,
                                      axisBounds: AxisBounds(),
                                      xAxisLabelInfo: AxisLabelInfo(
                                        title: 'Citas',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .subtitle1,
                                      ),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        title: 'Peso',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 300,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: containerUserDataRecordList
                                              .map((d) => d.numCIta)
                                              .toList(),
                                          yData: containerUserDataRecordList
                                              .map((d) => d.grasa)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: Color(0xFFA096B3),
                                            barWidth: 3,
                                          ),
                                        )
                                      ],
                                      backgroundColor: Colors.white,
                                      axisBounds: AxisBounds(),
                                      xAxisLabelInfo: AxisLabelInfo(
                                        title: 'Citas',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .subtitle1,
                                      ),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        title: '% de grasa',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 300,
                                    child: FlutterFlowLineChart(
                                      data: [
                                        FFLineChartData(
                                          xData: containerUserDataRecordList
                                              .map((d) => d.numCIta)
                                              .toList(),
                                          yData: containerUserDataRecordList
                                              .map((d) => d.imc)
                                              .toList(),
                                          settings: LineChartBarData(
                                            color: Color(0xFFA096B3),
                                            barWidth: 3,
                                          ),
                                        )
                                      ],
                                      backgroundColor: Colors.white,
                                      axisBounds: AxisBounds(),
                                      xAxisLabelInfo: AxisLabelInfo(
                                        title: 'Citas',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .subtitle1,
                                      ),
                                      yAxisLabelInfo: AxisLabelInfo(
                                        title: 'IMC',
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CUENTA_PAGE_CERRAR_SESIÓN_BTN_ON_TAP');
                                logFirebaseEvent('Button_Auth');
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Cerrar sesión',
                              options: FFButtonOptions(
                                width: 180,
                                height: 40,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
