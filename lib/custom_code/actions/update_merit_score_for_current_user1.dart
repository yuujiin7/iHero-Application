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
import 'package:flutter/services.dart';

Future<String> updateMeritScoreForCurrentUser1() async {
  CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  String currentUserID = FirebaseAuth.instance.currentUser!.uid;
  DocumentReference currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(currentUserID);

  QuerySnapshot finishedEventsSnapshot = await eventsCollection
      .where('isEnded', isEqualTo: true)
      .where('volunteer_ref', arrayContains: currentUserRef)
      .where('isMeritScoreUpdated', isEqualTo: false)
      .get();

  if (finishedEventsSnapshot.docs.length == 0) {
    return "None";
  }

  try {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot currentUserSnapshot =
          await transaction.get(currentUserRef);
      int currentMeritScore = currentUserSnapshot['meritScore'];

      if (currentMeritScore < 100) {
        int newMeritScore = currentMeritScore + 5;

        // Limit the merit score to a maximum of 100
        if (newMeritScore > 100) {
          newMeritScore = 100;
        }

        transaction.update(currentUserRef, {'meritScore': newMeritScore});
      }

      for (DocumentSnapshot eventSnapshot in finishedEventsSnapshot.docs) {
        DocumentReference eventRef = eventSnapshot.reference;
        transaction.update(eventRef, {'isMeritScoreUpdated': true});
      }
    });
  } on PlatformException {
    return "Error";
  }

  return "Success";
}
