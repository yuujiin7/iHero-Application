import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_delete_widget.dart';
import '/components/edit_events_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'event_full_detail_model.dart';
export 'event_full_detail_model.dart';

class EventFullDetailWidget extends StatefulWidget {
  const EventFullDetailWidget({
    Key? key,
    this.eventFullDetails,
  }) : super(key: key);

  final EventsRecord? eventFullDetails;

  @override
  _EventFullDetailWidgetState createState() => _EventFullDetailWidgetState();
}

class _EventFullDetailWidgetState extends State<EventFullDetailWidget> {
  late EventFullDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventFullDetailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'eventFullDetail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EVENT_FULL_DETAIL_eventFullDetail_ON_INI');
      logFirebaseEvent('eventFullDetail_custom_action');
      await actions.lockOrientation();
      logFirebaseEvent('eventFullDetail_update_app_state');
      setState(() {
        FFAppState().rateValue = 0;
        FFAppState().rateIsTapped = false;
      });
      logFirebaseEvent('eventFullDetail_custom_action');
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
        'Event Full Detail',
      );
    });

    _model.textController ??= TextEditingController();
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

    return FutureBuilder<EventsRecord>(
      future: EventsRecord.getDocumentOnce(widget.eventFullDetails!.reference),
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
        final eventFullDetailEventsRecord = snapshot.data!;
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
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 54.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'EVENT_FULL_DETAIL_arrow_back_rounded_ICN');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  title: FutureBuilder<PartnerOrgRecord>(
                    future: PartnerOrgRecord.getDocumentOnce(
                        eventFullDetailEventsRecord.partnerOrgRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRipple(
                              color: Color(0xFFFE2126),
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final textPartnerOrgRecord = snapshot.data!;
                      return AutoSizeText(
                        textPartnerOrgRecord.orgName,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Ubuntu',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 22.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleMediumFamily),
                            ),
                      );
                    },
                  ),
                  actions: [
                    Visibility(
                      visible:
                          valueOrDefault(currentUserDocument?.userType, '') ==
                              'Admin',
                      child: AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.emoji_people,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EVENT_FULL_DETAIL_emoji_people_ICN_ON_TA');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.goNamed(
                              'volunteerToEvent',
                              queryParameters: {
                                'volunteerListofEvent': serializeParam(
                                  widget.eventFullDetails,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'volunteerListofEvent': widget.eventFullDetails,
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          (valueOrDefault(currentUserDocument?.userType, '') ==
                                  'Admin') &&
                              !eventFullDetailEventsRecord.isEnded,
                      child: AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.edit,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EVENT_FULL_DETAIL_PAGE_edit_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: EditEventsWidget(
                                      eventsDetails:
                                          eventFullDetailEventsRecord.reference,
                                      isFromFirestore: true,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          valueOrDefault(currentUserDocument?.userType, '') ==
                              'Admin',
                      child: AuthUserStreamWidget(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: FaIcon(
                            FontAwesomeIcons.trashAlt,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EVENT_FULL_DETAIL_trashAlt_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: ConfirmDeleteWidget(
                                      eventRef:
                                          eventFullDetailEventsRecord.reference,
                                      isEvent: true,
                                      isAnnouncement: false,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0.0,
                )
              ],
              body: Builder(
                builder: (context) {
                  return SafeArea(
                    top: false,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EVENT_FULL_DETAIL_Image_th6ft5kf_ON_TAP');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            eventFullDetailEventsRecord
                                                .eventPhotoUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: valueOrDefault<String>(
                                          eventFullDetailEventsRecord
                                              .eventPhotoUrl,
                                          'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                        ),
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: valueOrDefault<String>(
                                    eventFullDetailEventsRecord.eventPhotoUrl,
                                    'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                  ),
                                  transitionOnUserGestures: true,
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      eventFullDetailEventsRecord.eventPhotoUrl,
                                      'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                    ),
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                eventFullDetailEventsRecord
                                                    .eventTitle,
                                                'Title',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Ubuntu',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            eventFullDetailEventsRecord
                                                .eventDescription,
                                            'Description',
                                          ).maybeHandleOverflow(
                                            maxChars: 500,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
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
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            eventFullDetailEventsRecord
                                                .addRequirementEvent,
                                            'Reminders/Requirements',
                                          ).maybeHandleOverflow(
                                            maxChars: 500,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Event Date:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          fontSize: 14.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${dateTimeFormat(
                                      'yMMMd',
                                      eventFullDetailEventsRecord
                                          .eventDateStart,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} - ${dateTimeFormat(
                                      'yMMMd',
                                      eventFullDetailEventsRecord.eventDateEnd,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} ${dateTimeFormat(
                                      'jm',
                                      eventFullDetailEventsRecord
                                          .eventDateStart,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )} - ${dateTimeFormat(
                                      'jm',
                                      eventFullDetailEventsRecord.eventDateEnd,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Person In  Charge:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          fontSize: 14.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      eventFullDetailEventsRecord
                                          .eventInChargePerson,
                                      'In Charge',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Contact:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          fontSize: 14.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      eventFullDetailEventsRecord
                                          .eventContactNumber,
                                      'contact Number',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          fontSize: 16.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Posted:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Barlow',
                                          color: Color(0xFF0B266B),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                        'relative',
                                        eventFullDetailEventsRecord
                                            .createdDate!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Barlow',
                                            color: Color(0xFF0B266B),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            if (functions.finishedEvent(
                                    eventFullDetailEventsRecord.eventDateStart!,
                                    eventFullDetailEventsRecord
                                        .eventDateEnd!) ==
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Reviews',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      StreamBuilder<
                                          List<CommentsAndRateRecord>>(
                                        stream: queryCommentsAndRateRecord(
                                          queryBuilder: (commentsAndRateRecord) =>
                                              commentsAndRateRecord
                                                  .where('post_type',
                                                      isEqualTo:
                                                          eventFullDetailEventsRecord
                                                              .reference)
                                                  .orderBy('created_at',
                                                      descending: true),
                                          limit: 4,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRipple(
                                                  color: Color(0xFFFE2126),
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CommentsAndRateRecord>
                                              listViewCommentsAndRateRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewCommentsAndRateRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewCommentsAndRateRecord =
                                                  listViewCommentsAndRateRecordList[
                                                      listViewIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  StreamBuilder<UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        listViewCommentsAndRateRecord
                                                            .createdBy!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: Color(
                                                                  0xFFFE2126),
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowUsersRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowUsersRecord
                                                                              .photoUrl,
                                                                          'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fblank-profile-picture-973460_1280.webp?alt=media&token=6b24d361-09ef-40bb-87f8-e501dd9e7222',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    rowUsersRecord.displayName,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  listViewCommentsAndRateRecord.comment,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Barlow',
                                                                                        fontSize: 12.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                Color(0xFFFFA534),
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating:
                                                                              listViewCommentsAndRateRecord.rating,
                                                                          unratedColor:
                                                                              Color(0xFF9E9E9E),
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              15.0,
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            'relative',
                                                                            listViewCommentsAndRateRecord.createdAt!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Barlow',
                                                                                color: Color(0xFF0B266B),
                                                                                fontSize: 10.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                      ),
                                      FutureBuilder<int>(
                                        future: queryCommentsAndRateRecordCount(
                                          queryBuilder: (commentsAndRateRecord) =>
                                              commentsAndRateRecord
                                                  .where('post_type',
                                                      isEqualTo: widget
                                                          .eventFullDetails!
                                                          .reference)
                                                  .where('created_by',
                                                      isEqualTo:
                                                          currentUserReference),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRipple(
                                                  color: Color(0xFFFE2126),
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          int containerCount = snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Visibility(
                                              visible: containerCount > 0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Rate and Review',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate:
                                                          (newValue) {
                                                        setState(() => _model
                                                                .ratingBarValue2 =
                                                            newValue);
                                                        logFirebaseEvent(
                                                            'EVENT_FULL_DETAIL_RatingBar_31la21gm_ON_');
                                                        logFirebaseEvent(
                                                            'RatingBar_clear_text_fields');
                                                        setState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'RatingBar_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .rateIsTapped =
                                                              true;
                                                          FFAppState()
                                                                  .rateValue =
                                                              functions.rateSuggestion(
                                                                  _model
                                                                      .ratingBarValue2!
                                                                      .round());
                                                        });
                                                      },
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            Color(0xFFFFA534),
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating: _model
                                                              .ratingBarValue2 ??=
                                                          3.0,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 40.0,
                                                      glowColor:
                                                          Color(0xFFFFA534),
                                                    ),
                                                    if (FFAppState()
                                                        .rateIsTapped)
                                                      Container(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width: 150.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      FFAppState()
                                                                              .ratingSuggestion[
                                                                          FFAppState()
                                                                              .rateValue],
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textController',
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                                () => setState(
                                                                    () {}),
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Write a Review',
                                                                hintText: FFAppState()
                                                                        .ratingSuggestion[
                                                                    FFAppState()
                                                                        .rateValue],
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Barlow',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                errorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              maxLines: 5,
                                                              minLines: 1,
                                                              validator: _model
                                                                  .textControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.send,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 15.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'EVENT_FULL_DETAIL_PAGE_send_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');

                                                              final commentsAndRateCreateData =
                                                                  createCommentsAndRateRecordData(
                                                                createdBy:
                                                                    currentUserReference,
                                                                createdAt:
                                                                    getCurrentTimestamp,
                                                                comment: _model
                                                                    .textController
                                                                    .text,
                                                                rating: _model
                                                                    .ratingBarValue2,
                                                                postType:
                                                                    eventFullDetailEventsRecord
                                                                        .reference,
                                                              );
                                                              await CommentsAndRateRecord
                                                                      .createDoc(
                                                                          eventFullDetailEventsRecord
                                                                              .reference)
                                                                  .set(
                                                                      commentsAndRateCreateData);
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');

                                                              final eventsUpdateData =
                                                                  {
                                                                ...createEventsRecordData(
                                                                  rateTotal: _model
                                                                      .ratingBarValue2,
                                                                ),
                                                                'rateCount':
                                                                    FieldValue
                                                                        .increment(
                                                                            1.0),
                                                              };
                                                              await eventFullDetailEventsRecord
                                                                  .reference
                                                                  .update(
                                                                      eventsUpdateData);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
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
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
