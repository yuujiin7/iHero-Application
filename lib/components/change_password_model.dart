import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool notMatch = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for currentPassword widget.
  TextEditingController? currentPasswordController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)? currentPasswordControllerValidator;
  // State field(s) for newPassword widget.
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  // State field(s) for confirmNewPsswrod widget.
  TextEditingController? confirmNewPsswrodController;
  late bool confirmNewPsswrodVisibility;
  String? Function(BuildContext, String?)? confirmNewPsswrodControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? success;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    newPasswordVisibility = false;
    confirmNewPsswrodVisibility = false;
  }

  void dispose() {
    currentPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmNewPsswrodController?.dispose();
  }

  /// Additional helper methods are added here.

}
