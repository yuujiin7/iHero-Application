import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'appointments_model.dart';
export 'appointments_model.dart';

class AppointmentsWidget extends StatefulWidget {
  const AppointmentsWidget({Key? key}) : super(key: key);

  @override
  _AppointmentsWidgetState createState() => _AppointmentsWidgetState();
}

class _AppointmentsWidgetState extends State<AppointmentsWidget> {
  late AppointmentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'appointments'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('APPOINTMENTS_appointments_ON_INIT_STATE');
      logFirebaseEvent('appointments_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('appointments_custom_action');
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
        'Appointments',
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                'Appointments',
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
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFEBEFF7),
                          ),
                          child: PagedListView<DocumentSnapshot<Object?>?,
                              RegistrationRecord>(
                            pagingController: () {
                              final Query<Object?> Function(Query<Object?>)
                                  queryBuilder =
                                  (registrationRecord) => registrationRecord
                                      .where('isDeleted', isEqualTo: false)
                                      .where('isConfirmbySA', isEqualTo: true)
                                      .orderBy('appointmentDate');
                              if (_model.pagingController != null) {
                                final query =
                                    queryBuilder(RegistrationRecord.collection);
                                if (query != _model.pagingQuery) {
                                  // The query has changed
                                  _model.pagingQuery = query;
                                  _model.streamSubscriptions
                                      .forEach((s) => s?.cancel());
                                  _model.streamSubscriptions.clear();
                                  _model.pagingController!.refresh();
                                }
                                return _model.pagingController!;
                              }

                              _model.pagingController =
                                  PagingController(firstPageKey: null);
                              _model.pagingQuery =
                                  queryBuilder(RegistrationRecord.collection);
                              _model.pagingController!
                                  .addPageRequestListener((nextPageMarker) {
                                queryRegistrationRecordPage(
                                  queryBuilder: (registrationRecord) =>
                                      registrationRecord
                                          .where('isDeleted', isEqualTo: false)
                                          .where('isConfirmbySA',
                                              isEqualTo: true)
                                          .orderBy('appointmentDate'),
                                  nextPageMarker: nextPageMarker,
                                  pageSize: 15,
                                  isStream: true,
                                ).then((page) {
                                  _model.pagingController!.appendPage(
                                    page.data,
                                    page.nextPageMarker,
                                  );
                                  final streamSubscription =
                                      page.dataStream?.listen((data) {
                                    data.forEach((item) {
                                      final itemIndexes = _model
                                          .pagingController!.itemList!
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      final index =
                                          itemIndexes[item.reference.id];
                                      final items =
                                          _model.pagingController!.itemList!;
                                      if (index != null) {
                                        items.replaceRange(
                                            index, index + 1, [item]);
                                        _model.pagingController!.itemList = {
                                          for (var item in items)
                                            item.reference: item
                                        }.values.toList();
                                      }
                                    });
                                    setState(() {});
                                  });
                                  _model.streamSubscriptions
                                      .add(streamSubscription);
                                });
                              });
                              return _model.pagingController!;
                            }(),
                            padding: EdgeInsets.zero,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<RegistrationRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: Color(0xFFFE2126),
                                    size: 50.0,
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Image.asset(
                                'assets/images/2895108.jpg',
                              ),
                              itemBuilder: (context, _, listViewIndex) {
                                final listViewRegistrationRecord = _model
                                    .pagingController!.itemList![listViewIndex];
                                return Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl: valueOrDefault<String>(
                                              listViewRegistrationRecord
                                                  .photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fblank-profile-picture-973460_1280.webp?alt=media&token=6b24d361-09ef-40bb-87f8-e501dd9e7222',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  listViewRegistrationRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 20.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  listViewRegistrationRecord
                                                      .email,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Barlow',
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
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                AutoSizeText(
                                                  dateTimeFormat(
                                                    'M/d h:mm a',
                                                    listViewRegistrationRecord
                                                        .appointmentDate!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Barlow',
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
                                        ),
                                      ],
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
              );
            },
          ),
        ),
      ),
    );
  }
}
