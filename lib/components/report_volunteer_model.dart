import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportVolunteerModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  DateTime? date;

  String? imgUrl;

  String? imgName;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textFieldController;
  String? Function(BuildContext, String?)? textFieldControllerValidator;
  String? _textFieldControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  DateTime? datePicked;
  // State field(s) for DescriptionEvent widget.
  TextEditingController? descriptionEventController;
  String? Function(BuildContext, String?)? descriptionEventControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UnethicalIllegalConductReportRecord? success;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldControllerValidator = _textFieldControllerValidator;
  }

  void dispose() {
    textFieldController?.dispose();
    descriptionEventController?.dispose();
  }

  /// Additional helper methods are added here.

}
