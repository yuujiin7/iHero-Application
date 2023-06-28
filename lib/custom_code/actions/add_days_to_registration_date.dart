// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DateTime> addDaysToRegistrationDate(
    DocumentReference documentId, int numberOfDays) async {
  // Retrieve the event document from Firestore
  DocumentSnapshot eventSnapshot = await documentId.get();

  // Get the registration date from the document
  final registrationDate =
      (eventSnapshot.data() as Map<String, dynamic>)['registrationDate']
          .toDate();

  // Add the specified number of days to the registration date
  DateTime newDate = registrationDate.add(Duration(days: numberOfDays));

  return newDate;
}
