import '../backend/backend.dart';
import '../components/comment_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ComentariosWidget extends StatefulWidget {
  const ComentariosWidget({
    Key key,
    this.descripcion,
    this.comentarios,
    this.tiempo,
    this.uid,
    this.random,
  }) : super(key: key);

  final String descripcion;
  final String comentarios;
  final DateTime tiempo;
  final String uid;
  final String random;

  @override
  _ComentariosWidgetState createState() => _ComentariosWidgetState();
}

class _ComentariosWidgetState extends State<ComentariosWidget> {
  PagingController<DocumentSnapshot, CommentsRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Comentarios'});
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserfotoRecord>>(
      stream: queryUserfotoRecord(
        queryBuilder: (userfotoRecord) => userfotoRecord
            .where('uid', isEqualTo: widget.uid)
            .where('random', isEqualTo: widget.random),
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
        List<UserfotoRecord> comentariosUserfotoRecordList = snapshot.data;
        final comentariosUserfotoRecord =
            comentariosUserfotoRecordList.isNotEmpty
                ? comentariosUserfotoRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30,
                ),
                onPressed: () async {
                  logFirebaseEvent('COMENTARIOS_arrow_back_rounded_ICN_ON_TA');
                  logFirebaseEvent('IconButton_Navigate-Back');
                  Navigator.pop(context);
                },
              ),
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          comentariosUserfotoRecord.foto,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: Text(
                                          comentariosUserfotoRecord.descripcion,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              'Comentarios:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 12),
                                      child: PagedListView<
                                          DocumentSnapshot<Object>,
                                          CommentsRecord>(
                                        pagingController: () {
                                          final Query<Object> Function(
                                                  Query<Object>) queryBuilder =
                                              (commentsRecord) =>
                                                  commentsRecord;
                                          if (_pagingController != null) {
                                            final query = queryBuilder(
                                                CommentsRecord.collection());
                                            if (query != _pagingQuery) {
                                              // The query has changed
                                              _pagingQuery = query;
                                              _streamSubscriptions
                                                  .forEach((s) => s?.cancel());
                                              _streamSubscriptions.clear();
                                              _pagingController.refresh();
                                            }
                                            return _pagingController;
                                          }

                                          _pagingController = PagingController(
                                              firstPageKey: null);
                                          _pagingQuery = queryBuilder(
                                              CommentsRecord.collection());
                                          _pagingController
                                              .addPageRequestListener(
                                                  (nextPageMarker) {
                                            queryCommentsRecordPage(
                                              parent: comentariosUserfotoRecord
                                                  .reference,
                                              queryBuilder: (commentsRecord) =>
                                                  commentsRecord,
                                              nextPageMarker: nextPageMarker,
                                              pageSize: 5,
                                              isStream: true,
                                            ).then((page) {
                                              _pagingController.appendPage(
                                                page.data,
                                                page.nextPageMarker,
                                              );
                                              final streamSubscription = page
                                                  .dataStream
                                                  ?.listen((data) {
                                                final itemIndexes =
                                                    _pagingController.itemList
                                                        .asMap()
                                                        .map((k, v) => MapEntry(
                                                            v.reference.id, k));
                                                data.forEach((item) {
                                                  final index = itemIndexes[
                                                      item.reference.id];
                                                  final items =
                                                      _pagingController
                                                          .itemList;
                                                  if (index != null) {
                                                    items.replaceRange(index,
                                                        index + 1, [item]);
                                                    _pagingController.itemList =
                                                        {
                                                      for (var item in items)
                                                        item.reference: item
                                                    }.values.toList();
                                                  }
                                                });
                                                setState(() {});
                                              });
                                              _streamSubscriptions
                                                  .add(streamSubscription);
                                            });
                                          });
                                          return _pagingController;
                                        }(),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                CommentsRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Center(
                                            child: CommentWidget(),
                                          ),
                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewCommentsRecord =
                                                _pagingController
                                                    .itemList[listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child: Image.asset(
                                                      'assets/images/_8109834.jpeg',
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.75,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF7F0EC),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        8,
                                                                        12,
                                                                        8),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Majo Alonzo',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  listViewCommentsRecord
                                                                      .commentdescription,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                        ],
                      ),
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
