import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'feedback_report_model.dart';
export 'feedback_report_model.dart';

class FeedbackReportWidget extends StatefulWidget {
  const FeedbackReportWidget({
    Key? key,
    this.falseInfo,
    this.memoralization,
    this.unethical,
  }) : super(key: key);

  final DocumentReference? falseInfo;
  final DocumentReference? memoralization;
  final DocumentReference? unethical;

  @override
  _FeedbackReportWidgetState createState() => _FeedbackReportWidgetState();
}

class _FeedbackReportWidgetState extends State<FeedbackReportWidget> {
  late FeedbackReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackReportModel());
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
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 15.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'INSTANT FEEDBACK REPORT',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 10.0, 32.0, 0.0),
                  child: Text(
                    'Your recent report to another volunteer was verified and a penalty was issued.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Barlow',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 25.0, 32.0, 0.0),
                  child: Text(
                    'One penalty prevents most volunteers from disrupting any more peace in the organization. Thanks for the assist!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Barlow',
                          fontSize: 20.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'FEEDBACK_REPORT_COMP_OK_BTN_ON_TAP');
                          if (widget.falseInfo != null) {
                            logFirebaseEvent('Button_backend_call');

                            final falseInformationReportUpdateData =
                                createFalseInformationReportRecordData(
                              isSeen: true,
                            );
                            await widget.falseInfo!
                                .update(falseInformationReportUpdateData);
                            logFirebaseEvent('Button_bottom_sheet');
                            Navigator.pop(context);
                            return;
                          } else {
                            if (widget.memoralization != null) {
                              logFirebaseEvent('Button_backend_call');

                              final memoralizationReportUpdateData =
                                  createMemoralizationReportRecordData(
                                isSeen: true,
                              );
                              await widget.memoralization!
                                  .update(memoralizationReportUpdateData);
                              logFirebaseEvent('Button_bottom_sheet');
                              Navigator.pop(context);
                              return;
                            } else {
                              if (widget.unethical != null) {
                                logFirebaseEvent('Button_backend_call');

                                final unethicalIllegalConductReportUpdateData =
                                    createUnethicalIllegalConductReportRecordData(
                                  isSeen: true,
                                );
                                await widget.unethical!.update(
                                    unethicalIllegalConductReportUpdateData);
                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);
                                return;
                              } else {
                                return;
                              }
                            }
                          }
                        },
                        text: 'Ok',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: Colors.white,
                                fontSize: 25.0,
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
