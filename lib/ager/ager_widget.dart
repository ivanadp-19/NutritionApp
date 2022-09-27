import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/sentimientos_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../sentimiento_crear/sentimiento_crear_widget.dart';
import '../sentimientos_extendidos/sentimientos_extendidos_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AgerWidget extends StatefulWidget {
  const AgerWidget({Key key}) : super(key: key);

  @override
  _AgerWidgetState createState() => _AgerWidgetState();
}

class _AgerWidgetState extends State<AgerWidget> {
  PagingController<DocumentSnapshot, SentimientosRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ager'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24,
          ),
          onPressed: () async {
            logFirebaseEvent('AGER_PAGE_arrow_back_rounded_ICN_ON_TAP');
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
          'Tus sentimientos',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          logFirebaseEvent('AGER_FloatingActionButton_rtdsehs3_ON_TA');
          logFirebaseEvent('FloatingActionButton_Navigate-To');
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SentimientoCrearWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: FaIcon(
          FontAwesomeIcons.plus,
        ),
        elevation: 8,
        label: Text(
          'Crear nuevo',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                child: Text(
                  '¿Comó te sientes?',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ),
              Text(
                'Estos son secretos y solo tú podrás verlos',
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
              PagedListView<DocumentSnapshot<Object>, SentimientosRecord>(
                pagingController: () {
                  final Query<Object> Function(Query<Object>) queryBuilder =
                      (sentimientosRecord) => sentimientosRecord
                          .orderBy('CreatedTime', descending: true);
                  if (_pagingController != null) {
                    final query = queryBuilder(SentimientosRecord.collection());
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
                  _pagingQuery = queryBuilder(SentimientosRecord.collection());
                  _pagingController.addPageRequestListener((nextPageMarker) {
                    querySentimientosRecordPage(
                      parent: currentUserReference,
                      queryBuilder: (sentimientosRecord) => sentimientosRecord
                          .orderBy('CreatedTime', descending: true),
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
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<SentimientosRecord>(
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
                    child: SentimientosWidget(),
                  ),
                  itemBuilder: (context, _, listViewIndex) {
                    final listViewSentimientosRecord =
                        _pagingController.itemList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewSentimientosRecord
                                                .sentimientoTitulo,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 4, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          listViewSentimientosRecord
                                              .descripcionSentimiento,
                                          maxLines: 5,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Ver más',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: FaIcon(
                                        FontAwesomeIcons.angleRight,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'AGER_PAGE_angleRight_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_Navigate-To');
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SentimientosExtendidosWidget(
                                              titulo: listViewSentimientosRecord
                                                  .sentimientoTitulo,
                                              descripcion:
                                                  listViewSentimientosRecord
                                                      .descripcionSentimiento,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
