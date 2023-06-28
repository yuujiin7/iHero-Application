import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportFalseInfoModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? imgName;

  String? imgUrl;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FullName widget.
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 50) {
      return 'Max 50 character';
    }

    return null;
  }

  // State field(s) for DescriptionEvent widget.
  TextEditingController? descriptionEventController;
  String? Function(BuildContext, String?)? descriptionEventControllerValidator;
  String? _descriptionEventControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 255) {
      return 'Max 255 character';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
    descriptionEventControllerValidator = _descriptionEventControllerValidator;
  }

  void dispose() {
    fullNameController?.dispose();
    descriptionEventController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
