import '../backend/backend.dart';
import '../categorias/categorias_widget.dart';
import '../components/recetas_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../receta/receta_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RecetaInicioWidget extends StatefulWidget {
  const RecetaInicioWidget({Key key}) : super(key: key);

  @override
  _RecetaInicioWidgetState createState() => _RecetaInicioWidgetState();
}

class _RecetaInicioWidgetState extends State<RecetaInicioWidget> {
  List<RecetasRecord> algoliaSearchResults = [];
  TextEditingController textController;
  PagingController<DocumentSnapshot, CategoriasRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'recetaInicio'});
    textController = TextEditingController();
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
            logFirebaseEvent('RECETA_INICIO_arrow_back_rounded_ICN_ON_');
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
          'Recetas',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x27000000),
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () async {
                            logFirebaseEvent(
                                'RECETA_INICIO_TextField_aztjj9mz_ON_TEXT');
                            logFirebaseEvent('TextField_Algolia-Search');
                            setState(() => algoliaSearchResults = null);
                            await RecetasRecord.search(
                              term: textController.text,
                              maxResults: 5,
                            )
                                .then((r) => algoliaSearchResults = r)
                                .onError((_, __) => algoliaSearchResults = [])
                                .whenComplete(() => setState(() {}));
                          },
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Buscar recetas...',
                          labelStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                child: Builder(
                  builder: (context) {
                    if (algoliaSearchResults == null) {
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
                    final resultados = algoliaSearchResults?.toList() ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: resultados.length,
                      itemBuilder: (context, resultadosIndex) {
                        final resultadosItem = resultados[resultadosIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 10, 40, 10),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'RECETA_INICIO_Container_g2vllui4_ON_TAP');
                              logFirebaseEvent('Container_Navigate-To');
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecetaWidget(
                                    titulo: resultadosItem.titulo,
                                    descripcion: resultadosItem.descripcion,
                                    categoria: resultadosItem.categoria,
                                    foto: resultadosItem.foto,
                                    ingredientes: resultadosItem.ingredientes,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        resultadosItem.foto,
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 0, 0),
                                      child: Text(
                                        resultadosItem.titulo
                                            .maybeHandleOverflow(
                                          maxChars: 37,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 4, 0, 0),
                                      child: Text(
                                        resultadosItem.categoria
                                            .maybeHandleOverflow(
                                          maxChars: 17,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
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
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Text(
                        'Categorias',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 110,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PagedListView<DocumentSnapshot<Object>,
                                  CategoriasRecord>(
                                pagingController: () {
                                  final Query<Object> Function(Query<Object>)
                                      queryBuilder =
                                      (categoriasRecord) => categoriasRecord;
                                  if (_pagingController != null) {
                                    final query = queryBuilder(
                                        CategoriasRecord.collection);
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

                                  _pagingController =
                                      PagingController(firstPageKey: null);
                                  _pagingQuery =
                                      queryBuilder(CategoriasRecord.collection);
                                  _pagingController
                                      .addPageRequestListener((nextPageMarker) {
                                    queryCategoriasRecordPage(
                                      queryBuilder: (categoriasRecord) =>
                                          categoriasRecord,
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
                                        final itemIndexes = _pagingController
                                            .itemList
                                            .asMap()
                                            .map((k, v) =>
                                                MapEntry(v.reference.id, k));
                                        data.forEach((item) {
                                          final index =
                                              itemIndexes[item.reference.id];
                                          final items =
                                              _pagingController.itemList;
                                          if (index != null) {
                                            items.replaceRange(
                                                index, index + 1, [item]);
                                            _pagingController.itemList = {
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
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                builderDelegate:
                                    PagedChildBuilderDelegate<CategoriasRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewCategoriasRecord =
                                        _pagingController
                                            .itemList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 8, 0, 8),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'RECETA_INICIO_Container_wwh5sbvd_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_Navigate-To');
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoriasWidget(
                                                categoria:
                                                    listViewCategoriasRecord
                                                        .nombre,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 120,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x230E151B),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    listViewCategoriasRecord
                                                        .foto,
                                                    width: 75,
                                                    height: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    listViewCategoriasRecord
                                                        .nombre,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                      child: Text(
                        'Recetas',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: StreamBuilder<List<RecetasRecord>>(
                  stream: queryRecetasRecord(),
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
                    List<RecetasRecord> wrapRecetasRecordList = snapshot.data;
                    if (wrapRecetasRecordList.isEmpty) {
                      return Center(
                        child: RecetasWidget(),
                      );
                    }
                    return Wrap(
                      spacing: 4,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.antiAlias,
                      children: List.generate(wrapRecetasRecordList.length,
                          (wrapIndex) {
                        final wrapRecetasRecord =
                            wrapRecetasRecordList[wrapIndex];
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'RECETA_INICIO_Container_cuzkxhpa_ON_TAP');
                            logFirebaseEvent('Container_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecetaWidget(
                                  titulo: wrapRecetasRecord.titulo,
                                  descripcion: wrapRecetasRecord.descripcion,
                                  categoria: wrapRecetasRecord.categoria,
                                  foto: wrapRecetasRecord.foto,
                                  ingredientes: wrapRecetasRecord.ingredientes,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: 200,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      wrapRecetasRecord.foto,
                                      width: double.infinity,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 12, 0, 0),
                                    child: AutoSizeText(
                                      wrapRecetasRecord.titulo
                                          .maybeHandleOverflow(
                                        maxChars: 37,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 4, 0, 0),
                                    child: Text(
                                      wrapRecetasRecord.categoria
                                          .maybeHandleOverflow(
                                        maxChars: 18,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
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
