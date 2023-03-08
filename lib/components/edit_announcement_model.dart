import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAnnouncementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TitleAnnouncement widget.
  TextEditingController? titleAnnouncementController;
  String? Function(BuildContext, String?)? titleAnnouncementControllerValidator;
  // State field(s) for DescriptionAnnouncement widget.
  TextEditingController? descriptionAnnouncementController;
  String? Function(BuildContext, String?)?
      descriptionAnnouncementControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    titleAnnouncementController?.dispose();
    descriptionAnnouncementController?.dispose();
  }

  /// Additional helper methods are added here.

}
