import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/calendar_widget.dart';
import '/components/select_cause_edit_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_events_model.dart';
export 'edit_events_model.dart';

class EditEventsWidget extends StatefulWidget {
  const EditEventsWidget({
    Key? key,
    this.eventsDetails,
    bool? isFromFirestore,
  })  : this.isFromFirestore = isFromFirestore ?? true,
        super(key: key);

  final DocumentReference? eventsDetails;
  final bool isFromFirestore;

  @override
  _EditEventsWidgetState createState() => _EditEventsWidgetState();
}

class _EditEventsWidgetState extends State<EditEventsWidget> {
  late EditEventsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEventsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
      child: StreamBuilder<EventsRecord>(
        stream: EventsRecord.getDocument(widget.eventsDetails!),
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
          final containerEventsRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEBEFF7),
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload Image',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Add-Add-New-Icon-Add-Media-Icon-Add-New-New-2935429.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'EDIT_EVENTS_COMP_Image_h3wwvzsg_ON_TAP');
                                    logFirebaseEvent(
                                        'Image_upload_media_to_firebase');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 60,
                                      allowPhoto: true,
                                      pickerFontFamily: 'Comfortaa',
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        containerEventsRecord.eventPhotoUrl,
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.titleEventController ??=
                                  TextEditingController(
                                text: containerEventsRecord.eventTitle,
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.titleEventController',
                                Duration(milliseconds: 200),
                                () async {
                                  logFirebaseEvent(
                                      'EDIT_EVENTS_TitleEvent_ON_TEXTFIELD_CHAN');
                                  logFirebaseEvent(
                                      'TitleEvent_update_app_state');
                                  setState(() {});
                                },
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Event Title',
                                hintText: 'Event Title',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model.titleEventControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^[\\s\\S]{0,65}'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.descriptionEventController ??=
                                  TextEditingController(
                                text: valueOrDefault<String>(
                                  containerEventsRecord.eventDescription,
                                  'Description',
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Event Description',
                                hintText: 'Event Description',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Ubuntu',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              maxLines: 20,
                              minLines: 1,
                              keyboardType: TextInputType.multiline,
                              validator: _model
                                  .descriptionEventControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^[\\s\\S]{0,500}'))
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _model.addRequirementEventController ??=
                                TextEditingController(
                              text: valueOrDefault<String>(
                                containerEventsRecord.addRequirementEvent,
                                'Requirement',
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Requirements/Reminders',
                              hintText: 'Requirements/Reminders',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Barlow',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            maxLines: 20,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            validator: _model
                                .addRequirementEventControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[\\s\\S]{0,500}'))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Start Date',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              FFAppState().startDate == null
                                                  ? dateTimeFormat(
                                                      'yMMMd',
                                                      containerEventsRecord
                                                          .eventDateStart!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : dateTimeFormat(
                                                      'yMMMd',
                                                      FFAppState().startDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Barlow',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          48.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            height: 100.0,
                                            child: VerticalDivider(
                                              thickness: 3.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'End Date',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              FFAppState().endDate == null
                                                  ? dateTimeFormat(
                                                      'yMMMd',
                                                      containerEventsRecord
                                                          .eventDateEnd!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : dateTimeFormat(
                                                      'yMMMd',
                                                      FFAppState().endDate,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Barlow',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 10.0,
                                        borderWidth: 1.0,
                                        buttonSize: 42.0,
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EDIT_EVENTS_date_range_rounded_ICN_ON_TA');
                                          logFirebaseEvent(
                                              'IconButton_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x00000000),
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: CalendarWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          logFirebaseEvent(
                                              'IconButton_update_widget_state');
                                          setState(() {
                                            _model.isDateSet = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Start Time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              FFAppState().startTime == null
                                                  ? dateTimeFormat(
                                                      'jm',
                                                      containerEventsRecord
                                                          .eventDateStart!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : dateTimeFormat(
                                                      'jm',
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Barlow',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
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
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EDIT_EVENTS_Container_pkk0sm94_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_date_time_picker');

                                        final _datePicked1Time =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              getCurrentTimestamp),
                                        );
                                        if (_datePicked1Time != null) {
                                          setState(() {
                                            _model.datePicked1 = DateTime(
                                              getCurrentTimestamp.year,
                                              getCurrentTimestamp.month,
                                              getCurrentTimestamp.day,
                                              _datePicked1Time.hour,
                                              _datePicked1Time.minute,
                                            );
                                          });
                                        }
                                        logFirebaseEvent(
                                            'Container_update_widget_state');
                                        setState(() {
                                          _model.isTimeSet = true;
                                        });
                                      },
                                      child: Container(
                                        width: 42.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Color(0xFFB51E1E),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 7.0, 7.0, 7.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.asset(
                                              'assets/images/timer.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80.0,
                                      child: VerticalDivider(
                                        thickness: 3.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'End Time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              FFAppState().endTime == null
                                                  ? dateTimeFormat(
                                                      'jm',
                                                      containerEventsRecord
                                                          .eventDateEnd!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )
                                                  : dateTimeFormat(
                                                      'jm',
                                                      _model.datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Barlow',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'EDIT_EVENTS_Container_bnb0kdx1_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_date_time_picker');

                                          final _datePicked2Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                          );
                                          if (_datePicked2Time != null) {
                                            setState(() {
                                              _model.datePicked2 = DateTime(
                                                getCurrentTimestamp.year,
                                                getCurrentTimestamp.month,
                                                getCurrentTimestamp.day,
                                                _datePicked2Time.hour,
                                                _datePicked2Time.minute,
                                              );
                                            });
                                          }
                                          logFirebaseEvent(
                                              'Container_update_widget_state');
                                          setState(() {
                                            _model.isTimeSet = true;
                                          });
                                        },
                                        child: Container(
                                          width: 42.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFFB51E1E),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 7.0, 7.0, 7.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/stop-watch.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Is Recurring?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
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
                                        Switch(
                                          value: _model.switchValue ??=
                                              containerEventsRecord.isRecurring,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.switchValue = newValue!);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.switchValue ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('Sunday'),
                                            ChipData('Monday'),
                                            ChipData('Tuesday'),
                                            ChipData('Wednesday'),
                                            ChipData('Thursday'),
                                            ChipData('Friday'),
                                            ChipData('saturday'),
                                            ChipData('Everyday')
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color: Colors.white,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            iconColor: Colors.white,
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      color: Color(0xFFE3E7ED),
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily),
                                                    ),
                                            iconColor: Color(0xFFE3E7ED),
                                            iconSize: 18.0,
                                            elevation: 4.0,
                                          ),
                                          chipSpacing: 20.0,
                                          rowSpacing: 17.0,
                                          multiselect: true,
                                          initialized:
                                              _model.choiceChipsValues != null,
                                          alignment: WrapAlignment.spaceEvenly,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.personInChargeController ??=
                                  TextEditingController(
                                text: containerEventsRecord.eventInChargePerson,
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              readOnly: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Event in charge Person',
                                hintText: 'Who is in charge?',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model
                                  .personInChargeControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^.{1,50}'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.contactNumberController ??=
                                  TextEditingController(
                                text: containerEventsRecord.eventContactNumber,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Contact Numer',
                                hintText: 'Contact Number',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              keyboardType: TextInputType.phone,
                              validator: _model.contactNumberControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^[\\d+\\-\\s]*\$'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.ageRequirementController ??=
                                  TextEditingController(
                                text: containerEventsRecord.ageRequirement
                                    .toString(),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Age Requirements',
                                hintText: 'Age Requirement',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .ageRequirementControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^\\d{0,3}'))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.neededVolunteerController ??=
                                  TextEditingController(
                                text: formatNumber(
                                  containerEventsRecord.neededVolunteer,
                                  formatType: FormatType.compact,
                                ),
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.neededVolunteerController',
                                Duration(milliseconds: 2000),
                                () async {
                                  logFirebaseEvent(
                                      'EDIT_EVENTS_neededVolunteer_ON_TEXTFIELD');
                                  logFirebaseEvent(
                                      'neededVolunteer_set_form_field');
                                  setState(() {
                                    _model.sliderValue = 0.0;
                                  });
                                },
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Volunteer Needed',
                                hintText: 'No. of volunteer needed',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .neededVolunteerControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^\\d{1,4}'))
                              ],
                            ),
                          ),
                          if ((_model.neededVolunteerController.text != null &&
                                  _model.neededVolunteerController.text !=
                                      '') ||
                              (containerEventsRecord.minimumVolunteer == null))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Set a minimum volunteer count',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.neededVolunteerController.text != null &&
                                  _model.neededVolunteerController.text !=
                                      '') ||
                              (containerEventsRecord.minimumVolunteer == null))
                            SliderTheme(
                              data: SliderThemeData(
                                showValueIndicator: ShowValueIndicator.always,
                              ),
                              child: Slider.adaptive(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).accent2,
                                min: 0.0,
                                max: valueOrDefault<double>(
                                  double.tryParse(
                                      _model.neededVolunteerController.text),
                                  0.0,
                                ),
                                value: _model.sliderValue ??= 0.0,
                                label: _model.sliderValue.toString(),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  setState(() => _model.sliderValue = newValue);
                                },
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.selectCauseEditModel,
                                updateCallback: () => setState(() {}),
                                child: SelectCauseEditWidget(
                                  eventRef: widget.eventsDetails,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: StreamBuilder<
                                                  List<PartnerOrgRecord>>(
                                                stream: queryPartnerOrgRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color:
                                                              Color(0xFFFE2126),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PartnerOrgRecord>
                                                      partnerDropDownPartnerOrgRecordList =
                                                      snapshot.data!;
                                                  return FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .partnerDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.partnerDropDownValue ??=
                                                          containerEventsRecord
                                                              .organizationPartnter,
                                                    ),
                                                    options:
                                                        partnerDropDownPartnerOrgRecordList
                                                            .map((e) =>
                                                                e.orgName)
                                                            .toList(),
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .partnerDropDownValue =
                                                          val);
                                                      logFirebaseEvent(
                                                          'EDIT_EVENTS_PartnerDropDown_ON_FORM_WIDG');
                                                      logFirebaseEvent(
                                                          'PartnerDropDown_update_app_state');
                                                      setState(() {});
                                                    },
                                                    width: 300.0,
                                                    height: 50.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        'Partner Organization',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: true,
                                                  );
                                                },
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: StreamBuilder<List<PartnerOrgRecord>>(
                                    stream: queryPartnerOrgRecord(
                                      queryBuilder: (partnerOrgRecord) =>
                                          partnerOrgRecord.where('org_name',
                                              isEqualTo:
                                                  _model.partnerDropDownValue),
                                      singleRecord: true,
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
                                      List<PartnerOrgRecord>
                                          buttonCancelPartnerOrgRecordList =
                                          snapshot.data!;
                                      final buttonCancelPartnerOrgRecord =
                                          buttonCancelPartnerOrgRecordList
                                                  .isNotEmpty
                                              ? buttonCancelPartnerOrgRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EDIT_EVENTS_COMP_ButtonCancel_ON_TAP');
                                          logFirebaseEvent(
                                              'ButtonCancel_bottom_sheet');
                                          Navigator.pop(context);
                                          logFirebaseEvent(
                                              'ButtonCancel_update_app_state');
                                          setState(() {
                                            FFAppState().deleteLocationLatLng();
                                            FFAppState().locationLatLng = null;

                                            FFAppState().deleteAddress();
                                            FFAppState().address = '';

                                            FFAppState().startDate = null;
                                            FFAppState().endDate = null;
                                            FFAppState().startTime = null;
                                            FFAppState().endTime = null;
                                          });
                                        },
                                        text: 'Cancel',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: StreamBuilder<List<PartnerOrgRecord>>(
                                    stream: queryPartnerOrgRecord(
                                      queryBuilder: (partnerOrgRecord) =>
                                          partnerOrgRecord.where('org_name',
                                              isEqualTo:
                                                  _model.partnerDropDownValue),
                                      singleRecord: true,
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
                                      List<PartnerOrgRecord>
                                          buttonSubmitPartnerOrgRecordList =
                                          snapshot.data!;
                                      final buttonSubmitPartnerOrgRecord =
                                          buttonSubmitPartnerOrgRecordList
                                                  .isNotEmpty
                                              ? buttonSubmitPartnerOrgRecordList
                                                  .first
                                              : null;
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EDIT_EVENTS_COMP_ButtonSubmit_ON_TAP');
                                          logFirebaseEvent(
                                              'ButtonSubmit_validate_form');
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (_model.datePicked1 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please set the start time.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            return;
                                          }
                                          if (_model.datePicked2 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please set the end time.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            return;
                                          }
                                          if (_model.selectCauseEditModel
                                                  .dropDownValue ==
                                              null) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please pick atleast one cause',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            return;
                                          }
                                          if (_model.partnerDropDownValue ==
                                              null) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please pick a paertner organiztion',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            return;
                                          }
                                          logFirebaseEvent(
                                              'ButtonSubmit_alert_dialog');
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Submit '),
                                                        content: Text(
                                                            'Are you sure?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            if (_model.switchValue!) {
                                              logFirebaseEvent(
                                                  'ButtonSubmit_backend_call');

                                              await widget.eventsDetails!
                                                  .update({
                                                ...createEventsRecordData(
                                                  eventTitle: _model
                                                      .titleEventController
                                                      .text,
                                                  eventPhotoUrl:
                                                      _model.uploadedFileUrl,
                                                  eventDescription: _model
                                                      .descriptionEventController
                                                      .text,
                                                  eventInChargePerson: _model
                                                      .personInChargeController
                                                      .text,
                                                  eventLocation: FFAppState()
                                                              .locationLatLng ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventLocation
                                                      : FFAppState()
                                                          .locationLatLng,
                                                  eventAddress: FFAppState()
                                                                  .address !=
                                                              null &&
                                                          FFAppState()
                                                                  .address !=
                                                              ''
                                                      ? containerEventsRecord
                                                          .eventAddress
                                                      : FFAppState().address,
                                                  neededVolunteerCount:
                                                      double.tryParse(_model
                                                          .neededVolunteerController
                                                          .text),
                                                  neededVolunteer:
                                                      double.tryParse(_model
                                                          .neededVolunteerController
                                                          .text),
                                                  isEnded: false,
                                                  isDeleted: false,
                                                  eventContactNumber: _model
                                                      .contactNumberController
                                                      .text,
                                                  isConfirmbySA: false,
                                                  eventDateStart: FFAppState()
                                                              .startDate ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventDateStart
                                                      : functions
                                                          .overwriteEvent(
                                                              FFAppState()
                                                                  .startDate!,
                                                              FFAppState()
                                                                  .startTime!),
                                                  eventDateEnd: FFAppState()
                                                              .endDate ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventDateEnd
                                                      : functions
                                                          .overwriteEvent(
                                                              FFAppState()
                                                                  .endDate!,
                                                              FFAppState()
                                                                  .endTime!),
                                                  isReqCancel: false,
                                                  partnerOrgRef:
                                                      buttonSubmitPartnerOrgRecord!
                                                          .reference,
                                                  isRecurring:
                                                      _model.switchValue,
                                                  volunteerCount: 0.0,
                                                  addRequirementEvent: _model
                                                      .addRequirementEventController
                                                      .text,
                                                  organizationPartnter: _model
                                                      .partnerDropDownValue,
                                                ),
                                                'recurranceDate':
                                                    _model.choiceChipsValues,
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSubmit_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Done'),
                                                    content: Text(
                                                        'Event has been edited.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Dismiss'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              logFirebaseEvent(
                                                  'ButtonSubmit_backend_call');

                                              await LogsRecord.createDoc(
                                                      currentUserReference!)
                                                  .set(createLogsRecordData(
                                                date: getCurrentTimestamp,
                                                action: 'Edited an event',
                                                userRef: currentUserReference,
                                                eventRef: widget.eventsDetails,
                                              ));
                                              logFirebaseEvent(
                                                  'ButtonSubmit_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .deleteLocationLatLng();
                                                FFAppState().locationLatLng =
                                                    null;

                                                FFAppState().deleteAddress();
                                                FFAppState().address = '';

                                                FFAppState().startDate = null;
                                                FFAppState().endDate = null;
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSubmit_bottom_sheet');
                                              Navigator.pop(context);
                                              return;
                                            } else {
                                              logFirebaseEvent(
                                                  'ButtonSubmit_backend_call');

                                              await widget.eventsDetails!
                                                  .update({
                                                ...createEventsRecordData(
                                                  eventTitle: _model
                                                      .titleEventController
                                                      .text,
                                                  eventPhotoUrl:
                                                      _model.uploadedFileUrl,
                                                  eventDescription: _model
                                                      .descriptionEventController
                                                      .text,
                                                  eventInChargePerson: _model
                                                      .personInChargeController
                                                      .text,
                                                  eventLocation: FFAppState()
                                                              .locationLatLng ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventLocation
                                                      : FFAppState()
                                                          .locationLatLng,
                                                  eventAddress: FFAppState()
                                                                  .address !=
                                                              null &&
                                                          FFAppState()
                                                                  .address !=
                                                              ''
                                                      ? containerEventsRecord
                                                          .eventAddress
                                                      : FFAppState().address,
                                                  neededVolunteerCount:
                                                      double.tryParse(_model
                                                          .neededVolunteerController
                                                          .text),
                                                  neededVolunteer:
                                                      double.tryParse(_model
                                                          .neededVolunteerController
                                                          .text),
                                                  isEnded: false,
                                                  isDeleted: false,
                                                  eventContactNumber: _model
                                                      .contactNumberController
                                                      .text,
                                                  isConfirmbySA: false,
                                                  eventDateStart: FFAppState()
                                                              .startDate ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventDateStart
                                                      : functions
                                                          .overwriteEvent(
                                                              FFAppState()
                                                                  .startDate!,
                                                              FFAppState()
                                                                  .startTime!),
                                                  eventDateEnd: FFAppState()
                                                              .endDate ==
                                                          null
                                                      ? containerEventsRecord
                                                          .eventDateEnd
                                                      : functions
                                                          .overwriteEvent(
                                                              FFAppState()
                                                                  .endDate!,
                                                              FFAppState()
                                                                  .endTime!),
                                                  isReqCancel: false,
                                                  partnerOrgRef:
                                                      buttonSubmitPartnerOrgRecord!
                                                          .reference,
                                                  isRecurring:
                                                      _model.switchValue,
                                                  volunteerCount: 0.0,
                                                  organizationPartnter: _model
                                                      .partnerDropDownValue,
                                                ),
                                                'recurranceDate':
                                                    FieldValue.delete(),
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSubmit_backend_call');

                                              await widget.eventsDetails!
                                                  .update({
                                                'recurranceDate':
                                                    FieldValue.arrayUnion(
                                                        ['Everyday']),
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSubmit_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Done'),
                                                    content: Text(
                                                        'Event has been edited.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Dismiss'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              logFirebaseEvent(
                                                  'ButtonSubmit_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .deleteLocationLatLng();
                                                FFAppState().locationLatLng =
                                                    null;

                                                FFAppState().deleteAddress();
                                                FFAppState().address = '';

                                                FFAppState().startDate = null;
                                                FFAppState().endDate = null;
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSubmit_bottom_sheet');
                                              Navigator.pop(context);
                                              return;
                                            }
                                          } else {
                                            return;
                                          }
                                        },
                                        text: 'Submit',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF2B8C2A),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      );
                                    },
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
              ),
            ),
          );
        },
      ),
    );
  }
}
