import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/back_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AnnouncementFeedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for backComponent component.
  late BackComponentModel backComponentModel;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, AnnouncementRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
  }

  void dispose() {
    backComponentModel.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Additional helper methods are added here.

}
