import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAnnouncementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TitleAnnouncement widget.
  TextEditingController? titleAnnouncementController;
  String? Function(BuildContext, String?)? titleAnnouncementControllerValidator;
  String? _titleAnnouncementControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 255) {
      return 'Max 255 character';
    }

    return null;
  }

  // State field(s) for DescriptionAnnouncement widget.
  TextEditingController? descriptionAnnouncementController;
  String? Function(BuildContext, String?)?
      descriptionAnnouncementControllerValidator;
  String? _descriptionAnnouncementControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 2200) {
      return 'Max 2200 character';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleAnnouncementControllerValidator =
        _titleAnnouncementControllerValidator;
    descriptionAnnouncementControllerValidator =
        _descriptionAnnouncementControllerValidator;
  }

  void dispose() {
    titleAnnouncementController?.dispose();
    descriptionAnnouncementController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
