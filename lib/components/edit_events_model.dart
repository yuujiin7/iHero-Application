import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/calendar_widget.dart';
import '/components/location_picker_widget.dart';
import '/components/select_cause_edit_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditEventsModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool isFromFirestore = false;

  bool isDateSet = false;

  bool isTimeSet = false;

  bool isLocSet = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TitleEvent widget.
  TextEditingController? titleEventController;
  String? Function(BuildContext, String?)? titleEventControllerValidator;
  // State field(s) for DescriptionEvent widget.
  TextEditingController? descriptionEventController;
  String? Function(BuildContext, String?)? descriptionEventControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  // State field(s) for PersonInCharge widget.
  TextEditingController? personInChargeController;
  String? Function(BuildContext, String?)? personInChargeControllerValidator;
  // State field(s) for ContactNumber widget.
  TextEditingController? contactNumberController;
  String? Function(BuildContext, String?)? contactNumberControllerValidator;
  // State field(s) for neededVolunteer widget.
  TextEditingController? neededVolunteerController;
  String? Function(BuildContext, String?)? neededVolunteerControllerValidator;
  // Model for selectCauseEdit component.
  late SelectCauseEditModel selectCauseEditModel;
  // State field(s) for PartnerDropDown widget.
  String? partnerDropDownValue;
  // Stores action output result for [Custom Action - documentExists] action in ButtonSubmit widget.
  bool? isEventExist;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    selectCauseEditModel = createModel(context, () => SelectCauseEditModel());
  }

  void dispose() {
    titleEventController?.dispose();
    descriptionEventController?.dispose();
    personInChargeController?.dispose();
    contactNumberController?.dispose();
    neededVolunteerController?.dispose();
    selectCauseEditModel.dispose();
  }

  /// Additional helper methods are added here.

}
