// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<bool> checkifhourbefore(
    String eventAddress, DateTime eventStartDate, DateTime eventEndDate) async {
  var currentUser = FirebaseAuth.instance.currentUser;
  var userDocRef =
      FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);

  var query = await FirebaseFirestore.instance
      .collection('events')
      .where('eventAddress', isEqualTo: eventAddress)
      .where('eventDateStart',
          isGreaterThanOrEqualTo: eventStartDate.subtract(Duration(hours: 1)))
      .where('myEvents', arrayContains: userDocRef)
      .orderBy('eventDateStart')
      .orderBy('eventDateEnd')
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
