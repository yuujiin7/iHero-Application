// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> documentExists2(
    String eventAddress, DateTime eventStartDate, DateTime eventEndDate) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection("events")
      .where("eventAddress", isEqualTo: eventAddress)
      .where("eventDateStart", isLessThan: eventEndDate)
      .get();

  final conflictingEvents = querySnapshot.docs.where((doc) {
    final eventDateStart = doc.get('eventDateStart').toDate() as DateTime;
    final eventDateEnd = doc.get('eventDateEnd').toDate() as DateTime;
    return eventDateStart.isBefore(eventEndDate) &&
        eventDateEnd.isAfter(eventStartDate);
  });

  if (conflictingEvents.isNotEmpty) {
    print(conflictingEvents.isNotEmpty);
    return true;
  } else {
    print(conflictingEvents.isNotEmpty);
    return false;
  }
}
