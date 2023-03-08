import '/auth/auth_util.dart';
import '/components/help_center_drawer_widget.dart';
import '/components/memo_request_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageDPAModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for helpCenterDrawer component.
  late HelpCenterDrawerModel helpCenterDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    helpCenterDrawerModel = createModel(context, () => HelpCenterDrawerModel());
  }

  void dispose() {
    helpCenterDrawerModel.dispose();
  }

  /// Additional helper methods are added here.

}
