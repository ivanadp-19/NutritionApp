import '../backend/backend.dart';
import '../components/recetas_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../receta/receta_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriasWidget extends StatefulWidget {
  const CategoriasWidget({
    Key key,
    this.categoria,
  }) : super(key: key);

  final String categoria;

  @override
  _CategoriasWidgetState createState() => _CategoriasWidgetState();
}

class _CategoriasWidgetState extends State<CategoriasWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Categorias'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).black600),
        automaticallyImplyLeading: true,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Recetas de ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    Text(
                      widget.categoria,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                child: StreamBuilder<List<RecetasRecord>>(
                  stream: queryRecetasRecord(
                    queryBuilder: (recetasRecord) => recetasRecord.where(
                        'categoria',
                        isEqualTo:
                            widget.categoria != '' ? widget.categoria : null),
                    limit: 50,
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
                    List<RecetasRecord> wrapRecetasRecordList = snapshot.data;
                    if (wrapRecetasRecordList.isEmpty) {
                      return Center(
                        child: RecetasWidget(),
                      );
                    }
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(wrapRecetasRecordList.length,
                          (wrapIndex) {
                        final wrapRecetasRecord =
                            wrapRecetasRecordList[wrapIndex];
                        return InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'CATEGORIAS_Container_l2rd727o_ON_TAP');
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
                                mainAxisSize: MainAxisSize.max,
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
                                    child: Text(
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
                                      wrapRecetasRecord.categoria,
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
