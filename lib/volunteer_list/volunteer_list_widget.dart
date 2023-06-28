import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'volunteer_list_model.dart';
export 'volunteer_list_model.dart';

class VolunteerListWidget extends StatefulWidget {
  const VolunteerListWidget({
    Key? key,
    this.volunteerList,
  }) : super(key: key);

  final DocumentReference? volunteerList;

  @override
  _VolunteerListWidgetState createState() => _VolunteerListWidgetState();
}

class _VolunteerListWidgetState extends State<VolunteerListWidget> {
  late VolunteerListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VolunteerListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'volunteerList'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VOLUNTEER_LIST_volunteerList_ON_INIT_STA');
      Function() _navigate = () {};
      logFirebaseEvent('volunteerList_custom_action');
      await actions.lockOrientation();
      if (valueOrDefault(currentUserDocument?.userType, '') == 'SuperAdmin') {
        logFirebaseEvent('volunteerList_auth');
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate = () => context.goNamedAuth('Onboarding', context.mounted);
        return;
      } else {
        logFirebaseEvent('volunteerList_custom_action');
        await actions.updateSession(
          currentUserReference!.id,
          getCurrentTimestamp,
          null,
          () {
            if (isAndroid) {
              return 'Android';
            } else if (isiOS) {
              return 'iOS';
            } else {
              return 'iOS';
            }
          }(),
          'Volunteer List',
        );
        return;
      }

      _navigate();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord
            .where('userType', isEqualTo: 'Volunteer')
            .orderBy('display_name'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: Color(0xFFFE2126),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UsersRecord> volunteerListUsersRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('VOLUNTEER_LIST_keyboard_backspace_ICN_ON');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                'VOLUNTEERS',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 22.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final volunteerlist =
                                volunteerListUsersRecordList.toList();
                            if (volunteerlist.isEmpty) {
                              return Center(
                                child: Image.asset(
                                  'assets/images/2895108.jpg',
                                ),
                              );
                            }
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: volunteerlist.length,
                              itemBuilder: (context, volunteerlistIndex) {
                                final volunteerlistItem =
                                    volunteerlist[volunteerlistIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                volunteerlistItem.photoUrl,
                                                'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fblank-profile-picture-973460_1280.webp?alt=media&token=6b24d361-09ef-40bb-87f8-e501dd9e7222',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                volunteerlistItem.displayName,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                volunteerlistItem.email,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 2.0, 0.0),
                                                child: Container(
                                                  width: 5.0,
                                                  height: 5.0,
                                                  decoration: BoxDecoration(
                                                    color: colorFromCssString(
                                                      functions.getStatusColor(
                                                          volunteerlistItem
                                                              .isDeceased,
                                                          volunteerlistItem
                                                              .startTime)!,
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.getUserStatus(
                                                      volunteerlistItem
                                                          .isDeceased,
                                                      volunteerlistItem
                                                          .startTime),
                                                  'status',
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Barlow',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 10.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
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
      },
    );
  }
}
