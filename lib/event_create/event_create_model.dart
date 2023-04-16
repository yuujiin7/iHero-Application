import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/calendar_widget.dart';
import '/components/location_picker_widget.dart';
import '/components/select_cause_create_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventCreateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getUserEmails] action in eventCreate widget.
  List<String>? emailList;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TitleEvent widget.
  TextEditingController? titleEventController;
  String? Function(BuildContext, String?)? titleEventControllerValidator;
  String? _titleEventControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 65) {
      return 'Maximum 65 characters allowed, currently ${val.length}.';
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

    if (val.length > 500) {
      return 'Maximum 500 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for addRequirementsEvent widget.
  TextEditingController? addRequirementsEventController;
  String? Function(BuildContext, String?)?
      addRequirementsEventControllerValidator;
  String? _addRequirementsEventControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 500) {
      return 'Maximum 500 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for PersonInCharge widget.
  TextEditingController? personInChargeController;
  String? Function(BuildContext, String?)? personInChargeControllerValidator;
  String? _personInChargeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ContactNumber widget.
  TextEditingController? contactNumberController;
  String? Function(BuildContext, String?)? contactNumberControllerValidator;
  String? _contactNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 13) {
      return 'Maximum 13 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(09|\\+639)\\d{9}\$').hasMatch(val)) {
      return 'Include the + symbol, country code (63). ';
    }
    return null;
  }

  // State field(s) for ageRequirement widget.
  TextEditingController? ageRequirementController;
  String? Function(BuildContext, String?)? ageRequirementControllerValidator;
  String? _ageRequirementControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 3) {
      return 'Max 3 character';
    }

    return null;
  }

  // State field(s) for neededVolunteer widget.
  TextEditingController? neededVolunteerController;
  String? Function(BuildContext, String?)? neededVolunteerControllerValidator;
  String? _neededVolunteerControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 4) {
      return 'Maximum 4 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?:[1-9]|[1-9]\\d{1,2}|1000)\$').hasMatch(val)) {
      return 'The input must be an integer between 1 and 1000. Please enter a valid number.';
    }
    return null;
  }

  // State field(s) for Slider widget.
  double? sliderValue;
  // Model for selectCauseCreate component.
  late SelectCauseCreateModel selectCauseCreateModel;
  // State field(s) for PartnerDropDown widget.
  String? partnerDropDownValue;
  FormFieldController<String>? partnerDropDownValueController;
  // Stores action output result for [Custom Action - documentExists] action in ButtonSubmit widget.
  bool? isEventExist;
  // Stores action output result for [Backend Call - Create Document] action in ButtonSubmit widget.
  EventsRecord? isCreated1;
  // Stores action output result for [Backend Call - Create Document] action in ButtonSubmit widget.
  EventsRecord? isCreated2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TitleAnnouncement widget.
  TextEditingController? titleAnnouncementController;
  String? Function(BuildContext, String?)? titleAnnouncementControllerValidator;
  String? _titleAnnouncementControllerValidator(
      BuildContext context, String? val) {
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

  // State field(s) for DescriptionAnnouncement widget.
  TextEditingController? descriptionAnnouncementController;
  String? Function(BuildContext, String?)?
      descriptionAnnouncementControllerValidator;
  String? _descriptionAnnouncementControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 500) {
      return 'Maximum 500 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AnnouncementRecord? announcement;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleEventControllerValidator = _titleEventControllerValidator;
    descriptionEventControllerValidator = _descriptionEventControllerValidator;
    addRequirementsEventControllerValidator =
        _addRequirementsEventControllerValidator;
    personInChargeControllerValidator = _personInChargeControllerValidator;
    contactNumberControllerValidator = _contactNumberControllerValidator;
    ageRequirementControllerValidator = _ageRequirementControllerValidator;
    neededVolunteerControllerValidator = _neededVolunteerControllerValidator;
    selectCauseCreateModel =
        createModel(context, () => SelectCauseCreateModel());
    titleAnnouncementControllerValidator =
        _titleAnnouncementControllerValidator;
    descriptionAnnouncementControllerValidator =
        _descriptionAnnouncementControllerValidator;
  }

  void dispose() {
    titleEventController?.dispose();
    descriptionEventController?.dispose();
    addRequirementsEventController?.dispose();
    personInChargeController?.dispose();
    contactNumberController?.dispose();
    ageRequirementController?.dispose();
    neededVolunteerController?.dispose();
    selectCauseCreateModel.dispose();
    titleAnnouncementController?.dispose();
    descriptionAnnouncementController?.dispose();
  }

  /// Additional helper methods are added here.

}
