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

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SfCalendar extends StatefulWidget {
  const SfCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SfCalendarState createState() => _SfCalendarState();
}

class _SfCalendarState extends State<SfCalendar> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    setState(() {
      if (args.value is PickerDateRange) {
        FFAppState().startDate = args.value
            .startDate; //Create a localState of type Timestamp called start Date
        FFAppState().endDate = (args.value.endDate ??
            args.value
                .startDate); //Create a localState of type Timestamp called endDate
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDateRangePicker(
        view: DateRangePickerView.year,
        enablePastDates: false, //You can use year or month view
        monthViewSettings: DateRangePickerMonthViewSettings(
            firstDayOfWeek:
                1), //Choose the first day of the week in the MONTH view 1 Monday, 2 Tuesday...
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged:
            _onSelectionChanged, //Single, multiple o range modeasda
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
