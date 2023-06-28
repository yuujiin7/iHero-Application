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

Future<bool> documentExists(String streetAddress, String city, String province,
    DateTime eventStartDate, DateTime eventEndDate) async {
  var query = await FirebaseFirestore.instance
      .collection("events")
      .where("streetAddress", isEqualTo: streetAddress)
      .where("City", isEqualTo: city)
      .where("Province", isEqualTo: province)
      .orderBy("eventDateStart")
      .orderBy("eventDateEnd")
      .limit(1)
      .startAt([eventStartDate]).endAt([eventEndDate]).get();

  if (query.docs.isNotEmpty) {
    print(query.docs.isNotEmpty);
    return true;
  } else {
    print(query.docs.isNotEmpty);
    return false;
  }
}
