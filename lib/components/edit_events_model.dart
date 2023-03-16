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
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
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
  String? _titleEventControllerValidator(BuildContext context, String? val) {
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

  // State field(s) for addRequirementEvent widget.
  TextEditingController? addRequirementEventController;
  String? Function(BuildContext, String?)?
      addRequirementEventControllerValidator;
  String? _addRequirementEventControllerValidator(
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
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsController;
  // State field(s) for PersonInCharge widget.
  TextEditingController? personInChargeController;
  String? Function(BuildContext, String?)? personInChargeControllerValidator;
  String? _personInChargeControllerValidator(
      BuildContext context, String? val) {
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

  // State field(s) for ContactNumber widget.
  TextEditingController? contactNumberController;
  String? Function(BuildContext, String?)? contactNumberControllerValidator;
  String? _contactNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 13) {
      return 'Max 13 character';
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
    if (!RegExp('^(09|\\+639)\\d{8}\$').hasMatch(val)) {
      return 'Invalid text';
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

    if (val.length > 5) {
      return 'Max 5 character';
    }

    return null;
  }

  // Model for selectCauseEdit component.
  late SelectCauseEditModel selectCauseEditModel;
  // State field(s) for PartnerDropDown widget.
  String? partnerDropDownValue;
  FormFieldController<String>? partnerDropDownController;
  // Stores action output result for [Custom Action - documentExists] action in ButtonSubmit widget.
  bool? isEventExist;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleEventControllerValidator = _titleEventControllerValidator;
    descriptionEventControllerValidator = _descriptionEventControllerValidator;
    addRequirementEventControllerValidator =
        _addRequirementEventControllerValidator;
    personInChargeControllerValidator = _personInChargeControllerValidator;
    contactNumberControllerValidator = _contactNumberControllerValidator;
    ageRequirementControllerValidator = _ageRequirementControllerValidator;
    neededVolunteerControllerValidator = _neededVolunteerControllerValidator;
    selectCauseEditModel = createModel(context, () => SelectCauseEditModel());
  }

  void dispose() {
    titleEventController?.dispose();
    descriptionEventController?.dispose();
    addRequirementEventController?.dispose();
    personInChargeController?.dispose();
    contactNumberController?.dispose();
    ageRequirementController?.dispose();
    neededVolunteerController?.dispose();
    selectCauseEditModel.dispose();
  }

  /// Additional helper methods are added here.

}
