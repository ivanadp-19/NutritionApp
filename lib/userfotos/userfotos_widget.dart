import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../comentarios/comentarios_widget.dart';
import '../create_post/create_post_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserfotosWidget extends StatefulWidget {
  const UserfotosWidget({Key key}) : super(key: key);

  @override
  _UserfotosWidgetState createState() => _UserfotosWidgetState();
}

class _UserfotosWidgetState extends State<UserfotosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'userfotos'});
  }

  @override
  Widget build(BuildContext context) {
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
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('USERFOTOS_arrow_back_rounded_ICN_ON_TAP');
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
          'Tus fotos',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('USERFOTOS_FloatingActionButton_u5uqbukt_');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x3A000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                child: StreamBuilder<List<UserfotoRecord>>(
                  stream: queryUserfotoRecord(
                    queryBuilder: (userfotoRecord) => userfotoRecord
                        .where('uid',
                            isEqualTo:
                                currentUserUid != '' ? currentUserUid : null)
                        .orderBy('Created_at', descending: true),
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
                    List<UserfotoRecord> socialFeedUserfotoRecordList =
                        snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(socialFeedUserfotoRecordList.length,
                              (socialFeedIndex) {
                        final socialFeedUserfotoRecord =
                            socialFeedUserfotoRecordList[socialFeedIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.94,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.96,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6,
                                          color: Color(0x3A000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        socialFeedUserfotoRecord.foto,
                                        width: 100,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 8, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'USERFOTOS_PAGE_Container_of57yrk8_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_Navigate-To');
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ComentariosWidget(
                                                        descripcion: '',
                                                        tiempo:
                                                            socialFeedUserfotoRecord
                                                                .createdAt,
                                                        uid: currentUserUid,
                                                        random:
                                                            socialFeedUserfotoRecord
                                                                .random,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .mode_comment_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          'comentarios',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 4, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 20),
                                          child: Text(
                                            socialFeedUserfotoRecord.descripcion
                                                .maybeHandleOverflow(
                                                    maxChars: 280),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
