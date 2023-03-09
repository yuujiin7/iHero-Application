import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/event_detail_bottom_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_map_model.dart';
export 'event_map_model.dart';

class EventMapWidget extends StatefulWidget {
  const EventMapWidget({
    Key? key,
    this.eventLocationLatLng,
  }) : super(key: key);

  final LatLng? eventLocationLatLng;

  @override
  _EventMapWidgetState createState() => _EventMapWidgetState();
}

class _EventMapWidgetState extends State<EventMapWidget> {
  late EventMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'eventMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENT_MAP_PAGE_eventMap_ON_PAGE_LOAD');
      Function() _navigate = () {};
      logFirebaseEvent('eventMap_custom_action');
      await actions.lockOrientation();
      if (valueOrDefault(currentUserDocument?.userType, '') == 'SuperAdmin') {
        logFirebaseEvent('eventMap_auth');
        GoRouter.of(context).prepareAuthEvent();
        await signOut();
        _navigate = () => context.goNamedAuth('splashScreen', mounted);
        return;
      } else {
        logFirebaseEvent('eventMap_custom_action');
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
          'Event Map',
        );
        return;
      }

      _navigate();
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

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'EVENT_MAP_keyboard_backspace_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 50.0, 0.0),
                              child: Text(
                                'EVENT MAP',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 20.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: StreamBuilder<List<EventsRecord>>(
                      stream: queryEventsRecord(
                        queryBuilder: (eventsRecord) => eventsRecord
                            .where('isEnded', isEqualTo: false)
                            .where('isDeleted', isEqualTo: false)
                            .where('eventDateStart',
                                isGreaterThanOrEqualTo: getCurrentTimestamp)
                            .where('isConfirmbySA', isEqualTo: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitSquareCircle(
                                color: Color(0xFFFE2126),
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<EventsRecord> googleMapEventsRecordList =
                            snapshot.data!;
                        return FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) =>
                              setState(() => _model.googleMapsCenter = latLng),
                          initialLocation: _model.googleMapsCenter ??=
                              widget.eventLocationLatLng!,
                          markers: googleMapEventsRecordList
                              .map(
                                (googleMapEventsRecord) => FlutterFlowMarker(
                                  googleMapEventsRecord.reference.path,
                                  googleMapEventsRecord.eventLocation!,
                                  () async {
                                    logFirebaseEvent(
                                        'EVENT_MAP_GoogleMap_ejfzcsh9_ON_MARKER_T');
                                    logFirebaseEvent('GoogleMap_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: EventDetailBottomWidget(
                                            eventDetails: googleMapEventsRecord,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                ),
                              )
                              .toList(),
                          markerColor: GoogleMarkerColor.red,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: false,
                          showLocation: true,
                          showCompass: true,
                          showMapToolbar: true,
                          showTraffic: true,
                          centerMapOnMarkerTap: true,
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
