import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_delete_widget.dart';
import '/components/edit_announcement_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'announcement_details_model.dart';
export 'announcement_details_model.dart';

class AnnouncementDetailsWidget extends StatefulWidget {
  const AnnouncementDetailsWidget({
    Key? key,
    this.announcementdetails,
  }) : super(key: key);

  final AnnouncementRecord? announcementdetails;

  @override
  _AnnouncementDetailsWidgetState createState() =>
      _AnnouncementDetailsWidgetState();
}

class _AnnouncementDetailsWidgetState extends State<AnnouncementDetailsWidget> {
  late AnnouncementDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnouncementDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'announcementDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANNOUNCEMENT_DETAILS_announcementDetails');
      Function() _navigate = () {};
      logFirebaseEvent('announcementDetails_custom_action');
      await actions.lockOrientation();
      if (valueOrDefault(currentUserDocument?.userType, '') == 'SuperAdmin') {
        logFirebaseEvent('announcementDetails_auth');
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate = () => context.goNamedAuth('Onboarding', context.mounted);
        return;
      } else {
        logFirebaseEvent('announcementDetails_custom_action');
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
          'Announcement Details',
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

    return StreamBuilder<AnnouncementRecord>(
      stream:
          AnnouncementRecord.getDocument(widget.announcementdetails!.reference),
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
        final announcementDetailsAnnouncementRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('ANNOUNCEMENT_DETAILS_arrow_back_rounded_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: AutoSizeText(
                widget.announcementdetails!.title,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Ubuntu',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
              actions: [
                Visibility(
                  visible: (currentUserReference ==
                          widget.announcementdetails!.createdBy) &&
                      (valueOrDefault(currentUserDocument?.userType, '') ==
                          'Admin'),
                  child: AuthUserStreamWidget(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.edit,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ANNOUNCEMENT_DETAILS_edit_ICN_ON_TAP');
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
                                child: EditAnnouncementWidget(
                                  announcementDetails:
                                      widget.announcementdetails!.reference,
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
                  visible: (currentUserReference ==
                          widget.announcementdetails!.createdBy) &&
                      (valueOrDefault(currentUserDocument?.userType, '') ==
                          'Admin'),
                  child: AuthUserStreamWidget(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: FaIcon(
                        FontAwesomeIcons.trashAlt,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ANNOUNCEMENT_DETAILS_trashAlt_ICN_ON_TAP');
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
                                  aannouncementref:
                                      widget.announcementdetails!.reference,
                                  isEvent: false,
                                  isAnnouncement: true,
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
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 286.6,
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
                              'ANNOUNCEMENT_DETAILS_Image_wsxsam92_ON_T');
                          logFirebaseEvent('Image_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    widget.announcementdetails!.photoUrl,
                                    'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  widget.announcementdetails!.photoUrl,
                                  'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            widget.announcementdetails!.photoUrl,
                            'https://firebasestorage.googleapis.com/v0/b/ihero-43ccd.appspot.com/o/users%2Fno-image.png?alt=media&token=3789cfb4-dd33-4c94-8711-646cc5ff4fa7',
                          ),
                          transitionOnUserGestures: true,
                          child: CachedNetworkImage(
                            imageUrl: valueOrDefault<String>(
                              widget.announcementdetails!.photoUrl,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AutoSizeText(
                            widget.announcementdetails!.title,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Ubuntu',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 16.0, 15.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          height: 350.0,
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  widget.announcementdetails!.body,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Barlow',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        width: double.infinity,
                        height: 20.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Date Posted:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Barlow',
                                      color: Color(0xFF0B266B),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
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
                                    widget.announcementdetails!.createdTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Barlow',
                                        color: Color(0xFF0B266B),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
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
