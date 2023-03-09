// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class PlacePicker extends StatefulWidget {
  const PlacePicker({
    Key? key,
    this.width,
    this.height,
    required this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() action;

  @override
  _PlacePickerState createState() => _PlacePickerState();
}

class _PlacePickerState extends State<PlacePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLocationPicker(
          selectLocationButtonText: 'Select Event Location',
          initZoom: 11,
          minZoomLevel: 5,
          maxZoomLevel: 24,
          trackMyPosition: true,
          onPicked: (pickedData) {
            setState(() {
              FFAppState().address = pickedData.address;
              FFAppState().locationLatLng = LatLng(
                  pickedData.latLong.latitude, pickedData.latLong.longitude);
              widget.action.call();
            });
          }),
    );
  }
}
