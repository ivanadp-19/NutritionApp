import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../dieta/dieta_widget.dart';
import '../dieta_pasada/dieta_pasada_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DietaspasadasWidget extends StatefulWidget {
  const DietaspasadasWidget({Key key}) : super(key: key);

  @override
  _DietaspasadasWidgetState createState() => _DietaspasadasWidgetState();
}

class _DietaspasadasWidgetState extends State<DietaspasadasWidget> {
  PagingController<DocumentSnapshot, DietasRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Dietaspasadas'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('DIETASPASADAS_arrow_back_sharp_ICN_ON_TA');
            logFirebaseEvent('IconButton_Navigate-To');
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DietaWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Dietas pasadas',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: PagedListView<DocumentSnapshot<Object>, DietasRecord>(
                    pagingController: () {
                      final Query<Object> Function(Query<Object>) queryBuilder =
                          (dietasRecord) => dietasRecord.orderBy('created_at',
                              descending: true);
                      if (_pagingController != null) {
                        final query = queryBuilder(DietasRecord.collection());
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
                      _pagingQuery = queryBuilder(DietasRecord.collection());
                      _pagingController
                          .addPageRequestListener((nextPageMarker) {
                        queryDietasRecordPage(
                          parent: currentUserReference,
                          queryBuilder: (dietasRecord) => dietasRecord
                              .orderBy('created_at', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 5,
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
                    builderDelegate: PagedChildBuilderDelegate<DietasRecord>(
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

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewDietasRecord =
                            _pagingController.itemList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'DIETASPASADAS_PAGE_menuItem_ON_TAP');
                              logFirebaseEvent('menuItem_Navigate-To');
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DietaPasadaWidget(
                                    dietaUrls: listViewDietasRecord.dietaUrl,
                                    tiempo: listViewDietasRecord.createdAt,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x411D2429),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 4, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Dieta del:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                  'd/M H:mm',
                                                  listViewDietasRecord
                                                      .createdAt),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DIETASPASADAS_PAGE_Icon_q6sxyr3f_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_Navigate-To');
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DietaPasadaWidget(
                                                    dietaUrls:
                                                        listViewDietasRecord
                                                            .dietaUrl,
                                                    tiempo: listViewDietasRecord
                                                        .createdAt,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.chevron_right_rounded,
                                              color: Color(0xFF57636C),
                                              size: 24,
                                            ),
                                          ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
