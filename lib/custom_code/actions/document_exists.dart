// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> documentExists(
    String eventAddress, String eventStartDate, String eventEndDate) async {
  var query = await queryEventsRecordOnce(
      queryBuilder: (EventsRecord) =>
          EventsRecord.where("eventStartDate", isEqualTo: eventStartDate)
              .where("isEnded", isEqualTo: false)
              .where("eventAddress", isEqualTo: eventAddress)
              .where("eventEndDate", isEqualTo: eventEndDate));

  if (query.isNotEmpty) {
    print(query.isNotEmpty);
    return true;
  } else {
    print(query.isNotEmpty);
    return false;
  }
}
