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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MemoRequestModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  DateTime? date;

  String? imgName;

  List<String> imageUrl = [];
  void addToImageUrl(String item) => imageUrl.add(item);
  void removeFromImageUrl(String item) => imageUrl.remove(item);
  void removeAtIndexFromImageUrl(int index) => imageUrl.removeAt(index);
  void updateImageUrlAtIndex(int index, Function(String) updateFn) =>
      imageUrl[index] = updateFn(imageUrl[index]);

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
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldControllerValidator = _textFieldControllerValidator;
  }

  void dispose() {
    textFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
