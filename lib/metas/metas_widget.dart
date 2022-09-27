import '../adds/adds_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/meta_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MetasWidget extends StatefulWidget {
  const MetasWidget({Key key}) : super(key: key);

  @override
  _MetasWidgetState createState() => _MetasWidgetState();
}

class _MetasWidgetState extends State<MetasWidget> {
  PagingController<DocumentSnapshot, MetasUserRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Metas'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
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
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('METAS_PAGE_arrow_back_rounded_ICN_ON_TAP');
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
          'Metas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('METAS_FloatingActionButton_8rv456ay_ON_T');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.scale,
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: AddsWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add,
        ),
        elevation: 8,
        label: Text(
          'Agregar meta',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Recuerda siempre\n tener claras tus metas.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF9575CD),
                          fontSize: 22,
                        ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child:
                      PagedListView<DocumentSnapshot<Object>, MetasUserRecord>(
                    pagingController: () {
                      final Query<Object> Function(Query<Object>) queryBuilder =
                          (metasUserRecord) => metasUserRecord;
                      if (_pagingController != null) {
                        final query =
                            queryBuilder(MetasUserRecord.collection());
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController.refresh();
                        }
                        return _pagingController;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(MetasUserRecord.collection());
                      _pagingController
                          .addPageRequestListener((nextPageMarker) {
                        queryMetasUserRecordPage(
                          parent: currentUserReference,
                          queryBuilder: (metasUserRecord) => metasUserRecord,
                          nextPageMarker: nextPageMarker,
                          pageSize: 10,
                          isStream: true,
                        ).then((page) {
                          _pagingController.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController.itemList
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController.itemList;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<MetasUserRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: MetaWidget(),
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewMetasUserRecord =
                            _pagingController.itemList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x20000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 0, 0),
                                          child: Text(
                                            listViewMetasUserRecord.tituloMeta,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 0, 0),
                                          child: Text(
                                            listViewMetasUserRecord
                                                .descripcionMeta,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ToggleIcon(
                                    onPressed: () async {
                                      final metasUserUpdateData = {
                                        'Cumplido':
                                            !listViewMetasUserRecord.cumplido,
                                      };
                                      await listViewMetasUserRecord.reference
                                          .update(metasUserUpdateData);
                                    },
                                    value: listViewMetasUserRecord.cumplido,
                                    onIcon: Icon(
                                      Icons.check_box,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    offIcon: Icon(
                                      Icons.check_box_outline_blank,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'METAS_PAGE_BORRAR_BTN_ON_TAP');
                                      logFirebaseEvent('Button_Backend-Call');
                                      await listViewMetasUserRecord.reference
                                          .delete();
                                      logFirebaseEvent('Button_Navigate-To');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                          reverseDuration:
                                              Duration(milliseconds: 0),
                                          child: MetasWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Borrar',
                                    options: FFButtonOptions(
                                      width: 70,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
