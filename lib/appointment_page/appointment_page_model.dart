import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/back_component_widget.dart';
import '/components/email_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppointmentPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for backComponent component.
  late BackComponentModel backComponentModel;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for fullName widget.
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
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for gender widget.
  String? genderValue;
  // State field(s) for nationality widget.
  TextEditingController? nationalityController;
  String? Function(BuildContext, String?)? nationalityControllerValidator;
  String? _nationalityControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for civilStatus widget.
  TextEditingController? civilStatusController;
  String? Function(BuildContext, String?)? civilStatusControllerValidator;
  String? _civilStatusControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for address widget.
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for contactNumber widget.
  TextEditingController? contactNumberController;
  String? Function(BuildContext, String?)? contactNumberControllerValidator;
  String? _contactNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(09|\\+639)\\d{9}\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 100) {
      return 'Maximum 100 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  bool isMediaUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backComponentModel = createModel(context, () => BackComponentModel());
    fullNameControllerValidator = _fullNameControllerValidator;
    nationalityControllerValidator = _nationalityControllerValidator;
    civilStatusControllerValidator = _civilStatusControllerValidator;
    addressControllerValidator = _addressControllerValidator;
    contactNumberControllerValidator = _contactNumberControllerValidator;
    emailControllerValidator = _emailControllerValidator;
  }

  void dispose() {
    backComponentModel.dispose();
    fullNameController?.dispose();
    nationalityController?.dispose();
    civilStatusController?.dispose();
    addressController?.dispose();
    contactNumberController?.dispose();
    emailController?.dispose();
  }

  /// Additional helper methods are added here.

}
