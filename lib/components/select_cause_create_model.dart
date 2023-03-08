import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectCauseCreateModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<String> selectedTagsList = [];
  void addToSelectedTagsList(String item) => selectedTagsList.add(item);
  void removeFromSelectedTagsList(String item) => selectedTagsList.remove(item);
  void removeAtIndexFromSelectedTagsList(int index) =>
      selectedTagsList.removeAt(index);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
