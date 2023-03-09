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
Future batchUpdateRestoreUser(List<DocumentReference> docRef) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  WriteBatch batch = firestore.batch();

  for (DocumentReference reference in docRef) {
    batch.update(reference, {'isDeleted': false, "expiry_date": null});
  }

  await batch.commit();

  return {
    'result': 'Documents successfully updated in a single batch operation'
  };
}
