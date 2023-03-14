import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/event_or_announcement_widget.dart';
import '/components/feedback_report_widget.dart';
import '/components/memoralization_report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - updateMeritScoreForCurrentUser] action in HomeScreen widget.
  String? result;
  // Stores action output result for [Custom Action - getUnseenReportByCurrentUser] action in HomeScreen widget.
  DocumentReference? unethical;
  // Stores action output result for [Custom Action - getUnseenReportByCurrentUserFalseInfo] action in HomeScreen widget.
  DocumentReference? falseInfo;
  // Stores action output result for [Custom Action - getUnseenReportByCurrentUserMemorialization] action in HomeScreen widget.
  DocumentReference? memo;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
