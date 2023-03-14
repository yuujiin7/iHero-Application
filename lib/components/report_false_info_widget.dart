import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_false_info_model.dart';
export 'report_false_info_model.dart';

class ReportFalseInfoWidget extends StatefulWidget {
  const ReportFalseInfoWidget({Key? key}) : super(key: key);

  @override
  _ReportFalseInfoWidgetState createState() => _ReportFalseInfoWidgetState();
}

class _ReportFalseInfoWidgetState extends State<ReportFalseInfoWidget> {
  late ReportFalseInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportFalseInfoModel());

    _model.fullNameController ??= TextEditingController();
    _model.descriptionEventController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEBEFF7),
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 15.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
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
                              'Report False Information',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title2Family,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title2Family),
                                      ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Defamation Reporting Form',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'REPORT_FALSE_INFO_close_rounded_ICN_ON_T');
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'This form is intended for reporting content posted on iHero that you believe is defamatory.',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Barlow',
                          fontSize: 13.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Please provide the reported complainant\'s information',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: _model.fullNameController,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Full Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                validator: _model.fullNameControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 5.0),
                            child: Text(
                              'Please explain where the content appears, the specific statements you believe are defamatory, and why you believe they are defamatory.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: _model.descriptionEventController,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Description',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Ubuntu',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFB51E1E),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                maxLines: 12,
                                keyboardType: TextInputType.multiline,
                                validator: _model
                                    .descriptionEventControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Text(
                              'Please provide any additional evidence or court orders demonstrating that the statements are defamatory.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  _model.imgName != null &&
                                                          _model.imgName != ''
                                                      ? _model.imgName
                                                      : 'Upload Photo/Video',
                                                  'Upload Photo/Video',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Barlow',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 10.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      Icons.photo_camera,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 25.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'REPORT_FALSE_INFO_photo_camera_ICN_ON_TA');
                                      logFirebaseEvent(
                                          'IconButton_upload_media_to_firebase');
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        imageQuality: 60,
                                        allowPhoto: true,
                                        allowVideo: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isMediaUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];
                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
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
                                          _model.isMediaUploading = false;
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
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      logFirebaseEvent(
                                          'IconButton_update_widget_state');
                                      setState(() {
                                        _model.imgName = valueOrDefault<String>(
                                          functions.getFileNameFromUrl(
                                              _model.uploadedFileUrl),
                                          'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                        );
                                        _model.imgUrl = _model.uploadedFileUrl;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 5.0),
                            child: Text(
                              'DECLARATION STATEMENT',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: Color(0xFFB51E1E),
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 5.0),
                            child: Text(
                              'By submitting this notice, you state: that you have a good faith belief that the content you are reporting is unlawful in the manner described above; that the information contained in this report is accurate to submit this report.',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Barlow',
                                    color: Colors.black,
                                    fontSize: 12.0,
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
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'REPORT_FALSE_INFO_COMP_SEND_BTN_ON_TAP');
                          logFirebaseEvent('Button_alert_dialog');
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Report False Information'),
                                    content: Text(
                                        'Are you sure you want to submit this report?'),
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
                            logFirebaseEvent('Button_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            logFirebaseEvent('Button_backend_call');

                            final falseInformationReportCreateData =
                                createFalseInformationReportRecordData(
                              fullName: _model.fullNameController.text,
                              reportDetail:
                                  _model.descriptionEventController.text,
                              photoUrl: _model.uploadedFileUrl,
                              reportBy: currentUserReference,
                              reportedAt: getCurrentTimestamp,
                              isConfirmbySA: false,
                              isDeclined: false,
                              isSeen: false,
                            );
                            await FalseInformationReportRecord.collection
                                .doc()
                                .set(falseInformationReportCreateData);
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Success'),
                                  content: Text('Report has been made'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                            return;
                          } else {
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                            return;
                          }
                        },
                        text: 'Send',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF2B8C2A),
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: Colors.white,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
  }
}
