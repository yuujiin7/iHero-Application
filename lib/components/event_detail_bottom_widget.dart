import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_detail_bottom_model.dart';
export 'event_detail_bottom_model.dart';

class EventDetailBottomWidget extends StatefulWidget {
  const EventDetailBottomWidget({
    Key? key,
    this.eventDetails,
  }) : super(key: key);

  final EventsRecord? eventDetails;

  @override
  _EventDetailBottomWidgetState createState() =>
      _EventDetailBottomWidgetState();
}

class _EventDetailBottomWidgetState extends State<EventDetailBottomWidget> {
  late EventDetailBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventDetailBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 600.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x32171717),
              offset: Offset(0.0, -4.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 200.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 166.3,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: Color(0x32171717),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: CachedNetworkImage(
                      imageUrl: valueOrDefault<String>(
                        widget.eventDetails!.eventPhotoUrl,
                        'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFA534),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventDetails!.eventTitle!,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Ubuntu',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WHERE',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color: Color(0xFFEBEFF7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            widget.eventDetails!.eventAddress!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WHEN',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            '${widget.eventDetails!.eventDateStart == widget.eventDetails!.eventDateEnd ? widget.eventDetails!.eventDateStart?.toString() : '${dateTimeFormat(
                                'yMMMd',
                                widget.eventDetails!.eventDateStart,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )} - ${dateTimeFormat(
                                'yMMMd',
                                widget.eventDetails!.eventDateEnd,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}'}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Text(
                            '${dateTimeFormat(
                              'jm',
                              widget.eventDetails!.eventDateStart,
                              locale: FFLocalizations.of(context).languageCode,
                            )} - ${dateTimeFormat(
                              'jm',
                              widget.eventDetails!.eventDateEnd,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'PERSON IN CHARGE',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Barlow',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.eventDetails!.eventInChargePerson!,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Barlow',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.eventDetails!.eventContactNumber!,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Barlow',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'EVENT DESCRIPTION',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Barlow',
                              color: Color(0xFFEBEFF7),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        widget.eventDetails!.eventDescription!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Barlow',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if ((widget.eventDetails!.neededVolunteer ==
                            widget.eventDetails!.volunteerCount) ||
                        (widget.eventDetails!.registrationDate! <
                            getCurrentTimestamp))
                      FFButtonWidget(
                        onPressed: widget.eventDetails!.volunteerRef!
                                .toList()
                                .contains(currentUserReference)
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'EVENT_DETAIL_BOTTOM_VOLUNTEER_BTN_ON_TAP');
                                var _shouldSetState = false;
                                logFirebaseEvent('Button_custom_action');
                                _model.hasJoined =
                                    await actions.checkUserEventInterval(
                                  currentUserUid,
                                  widget.eventDetails!.reference.id,
                                );
                                _shouldSetState = true;
                                if (_model.hasJoined!) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'You have an event 1 hr prior this event. You can\'t register on this event.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                _model.hasJoined!.toString()),
                                            content: Text(
                                                'Do wish to continue to register in this event?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    if (widget.eventDetails!.ageRequirement ==
                                        null) {
                                      logFirebaseEvent('Button_backend_call');

                                      final eventsUpdateData1 = {
                                        'volunteer_names':
                                            FieldValue.arrayUnion(
                                                [currentUserDisplayName]),
                                        'needed_volunteer_count':
                                            FieldValue.increment(-(1.0)),
                                        'volunteer_count':
                                            FieldValue.increment(1.0),
                                        'volunteer_ref': FieldValue.arrayUnion(
                                            [currentUserReference]),
                                        'volunteer_list': FieldValue.arrayUnion(
                                            [currentUserUid]),
                                      };
                                      await widget.eventDetails!.reference
                                          .update(eventsUpdateData1);
                                      logFirebaseEvent('Button_backend_call');

                                      final logsCreateData1 =
                                          createLogsRecordData(
                                        date: getCurrentTimestamp,
                                        action: 'Joined an Event',
                                        userRef: currentUserReference,
                                        eventRef:
                                            widget.eventDetails!.reference,
                                      );
                                      await LogsRecord.createDoc(
                                              currentUserReference!)
                                          .set(logsCreateData1);
                                      logFirebaseEvent('Button_backend_call');

                                      final myEventsCreateData1 =
                                          createMyEventsRecordData(
                                        dateJoined: getCurrentTimestamp,
                                        eventReference:
                                            widget.eventDetails!.reference,
                                      );
                                      await MyEventsRecord.createDoc(
                                              currentUserReference!)
                                          .set(myEventsCreateData1);
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Success'),
                                            content: Text(
                                                'Great! Thank you for registering to this event!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      logFirebaseEvent('Button_bottom_sheet');
                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument?.age, 0) <
                                          widget
                                              .eventDetails!.ageRequirement!) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Sorry, you do not meet the age requirement for this event'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        final eventsUpdateData2 = {
                                          'volunteer_names':
                                              FieldValue.arrayUnion(
                                                  [currentUserDisplayName]),
                                          'needed_volunteer_count':
                                              FieldValue.increment(-(1.0)),
                                          'volunteer_count':
                                              FieldValue.increment(1.0),
                                          'volunteer_ref':
                                              FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                          'volunteer_list':
                                              FieldValue.arrayUnion(
                                                  [currentUserUid]),
                                        };
                                        await widget.eventDetails!.reference
                                            .update(eventsUpdateData2);
                                        logFirebaseEvent('Button_backend_call');

                                        final myEventsCreateData2 =
                                            createMyEventsRecordData(
                                          dateJoined: getCurrentTimestamp,
                                          eventReference:
                                              widget.eventDetails!.reference,
                                        );
                                        await MyEventsRecord.createDoc(
                                                currentUserReference!)
                                            .set(myEventsCreateData2);
                                        logFirebaseEvent('Button_backend_call');

                                        final logsCreateData2 =
                                            createLogsRecordData(
                                          date: getCurrentTimestamp,
                                          action: 'Joined an Event',
                                          userRef: currentUserReference,
                                          eventRef:
                                              widget.eventDetails!.reference,
                                        );
                                        await LogsRecord.createDoc(
                                                currentUserReference!)
                                            .set(logsCreateData2);
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Success'),
                                              content: Text(
                                                  'Great! Thank you for registering to this event!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        logFirebaseEvent('Button_bottom_sheet');
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }

                                if (_shouldSetState) setState(() {});
                              },
                        text: widget.eventDetails!.volunteerRef!
                                .toList()
                                .contains(currentUserReference)
                            ? 'Registered'
                            : 'Volunteer',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Comfortaa',
                                color: Color(0xFFFF0000),
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          disabledColor: FlutterFlowTheme.of(context).alternate,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
