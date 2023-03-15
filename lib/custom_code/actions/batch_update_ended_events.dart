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

Future<void> batchUpdateEndedEvents() async {
  final firestore = FirebaseFirestore.instance;
  final now = Timestamp.now();

  final querySnapshot = await firestore
      .collection("events")
      .where("eventDateEnd", isLessThan: now)
      .get();

  final batch = firestore.batch();
  for (final document in querySnapshot.docs) {
    //final expiryDate = now.toDate().add(Duration(days: 30));
    batch.update(document.reference, {"isEnded": true});
  }
  await batch.commit();
}
