import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String? _currentPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Min 10 character';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for newPassword widget.
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  String? _newPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^\\w\\s]).{8,100}\$')
        .hasMatch(val)) {
      return 'Password must be 8-100characters long and contain at least one uppercase letter, one digit, and one special character.';
    }
    return null;
  }

  // State field(s) for confirmNewPsswrod widget.
  TextEditingController? confirmNewPsswrodController;
  late bool confirmNewPsswrodVisibility;
  String? Function(BuildContext, String?)? confirmNewPsswrodControllerValidator;
  String? _confirmNewPsswrodControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^\\w\\s]).{8,100}\$')
        .hasMatch(val)) {
      return 'Password must be 8-100 characters long and contain at least one uppercase letter, one digit, and one special character.';
    }
    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? success;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    currentPasswordControllerValidator = _currentPasswordControllerValidator;
    newPasswordVisibility = false;
    newPasswordControllerValidator = _newPasswordControllerValidator;
    confirmNewPsswrodVisibility = false;
    confirmNewPsswrodControllerValidator =
        _confirmNewPsswrodControllerValidator;
  }

  void dispose() {
    currentPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmNewPsswrodController?.dispose();
  }

  /// Additional helper methods are added here.

}
