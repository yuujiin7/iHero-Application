// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference<Map<String, dynamic>>?> documentExistsCopy(
    String eventAddress, DateTime eventStartDate, DateTime eventEndDate) async {
  var querySnapshot = await FirebaseFirestore.instance
      .collection("events")
      .where("eventAddress", isEqualTo: eventAddress)
      .orderBy("eventDateStart")
      .orderBy("eventDateEnd")
      .limit(1)
      .startAt([eventStartDate]).endAt([eventEndDate]).get();

  if (querySnapshot.docs.isNotEmpty) {
    print(querySnapshot.docs.isNotEmpty);
    return querySnapshot.docs.first.reference;
  } else {
    print(querySnapshot.docs.isNotEmpty);
    return null;
  }
}
