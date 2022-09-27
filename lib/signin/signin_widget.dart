import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key key}) : super(key: key);

  @override
  _SigninWidgetState createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController emailAddressCreateController;
  TextEditingController nombreController;
  TextEditingController passwordCreateController;
  bool passwordCreateVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    emailAddressCreateController = TextEditingController();
    nombreController = TextEditingController();
    passwordCreateController = TextEditingController();
    passwordCreateVisibility = false;
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Signin'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF84B2A6),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Majo Alonzo',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Montserrat',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 22,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: FlutterFlowTheme.of(context).primaryBtnText,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        labelStyle: FlutterFlowTheme.of(context).subtitle1,
                        indicatorColor:
                            FlutterFlowTheme.of(context).primaryBtnText,
                        tabs: [
                          Tab(
                            text: 'Inicia sesion',
                          ),
                          Tab(
                            text: 'Registrate',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 24, 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 0),
                                    child: TextFormField(
                                      controller: emailAddressController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        hintText: 'ingrese email',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0F1113),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 12, 20, 0),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        hintText: 'Ingrese contraseña',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 24, 20, 24),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0F1113),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 24, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SIGNIN_PAGE_Button-Login_ON_TAP');
                                        logFirebaseEvent('Button-Login_Auth');

                                        final user = await signInWithEmail(
                                          context,
                                          emailAddressController.text,
                                          passwordController.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'Inicia sesion',
                                      options: FFButtonOptions(
                                        width: 230,
                                        height: 50,
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: TextFormField(
                                        controller: nombreController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText: 'Nombre completo',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F1113),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 20, 0),
                                      child: TextFormField(
                                        controller:
                                            emailAddressCreateController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText: 'Ingrese email',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F1113),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 12, 20, 0),
                                      child: TextFormField(
                                        controller: passwordCreateController,
                                        obscureText: !passwordCreateVisibility,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText: 'Ingresa contraseña',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordCreateVisibility =
                                                  !passwordCreateVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              passwordCreateVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0F1113),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'SIGNIN_PAGE_Button-Login_ON_TAP');
                                          logFirebaseEvent('Button-Login_Auth');

                                          final user =
                                              await createAccountWithEmail(
                                            context,
                                            emailAddressCreateController.text,
                                            passwordCreateController.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          final usersCreateData =
                                              createUsersRecordData(
                                            displayName: nombreController.text,
                                            isAdmin: false,
                                          );
                                          await UsersRecord.collection
                                              .doc(user.uid)
                                              .update(usersCreateData);

                                          logFirebaseEvent(
                                              'Button-Login_Backend-Call');

                                          final userDataCreateData =
                                              createUserDataRecordData();
                                          await UserDataRecord.createDoc(
                                                  currentUserReference)
                                              .set(userDataCreateData);
                                          logFirebaseEvent(
                                              'Button-Login_Backend-Call');

                                          final sentimientosCreateData =
                                              createSentimientosRecordData(
                                            sentimientoTitulo:
                                                'Nuestro primer sentimiento!',
                                            descripcionSentimiento:
                                                '¡Empezamos esta nueva aventura!',
                                            createdTime: getCurrentTimestamp,
                                          );
                                          await SentimientosRecord.createDoc(
                                                  currentUserReference)
                                              .set(sentimientosCreateData);
                                          logFirebaseEvent(
                                              'Button-Login_Backend-Call');

                                          final metasUserCreateData =
                                              createMetasUserRecordData(
                                            tituloMeta: 'Primera meta!',
                                            descripcionMeta:
                                                'Recuerda que eres capaz de cumplir todas tus metas',
                                          );
                                          await MetasUserRecord.createDoc(
                                                  currentUserReference)
                                              .set(metasUserCreateData);
                                          logFirebaseEvent(
                                              'Button-Login_Backend-Call');

                                          final dietasCreateData =
                                              createDietasRecordData(
                                            dietaUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/majoapp-c8b98.appspot.com/o/users%2FbGIJH8sTkaeVybLvCcrbpOb88go2%2Fuploads%2F1657472642138000.pdf?alt=media&token=a533ceb6-06c8-453d-a35a-c8a4e66ce1dc',
                                            createdAt: getCurrentTimestamp,
                                          );
                                          await DietasRecord.createDoc(
                                                  currentUserReference)
                                              .set(dietasCreateData);
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Crea tu cuenta',
                                        options: FFButtonOptions(
                                          width: 230,
                                          height: 50,
                                          color: Colors.white,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
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
        ),
      ),
    );
  }
}
