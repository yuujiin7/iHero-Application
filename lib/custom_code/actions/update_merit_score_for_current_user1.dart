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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<String> updateMeritScoreForCurrentUser1() async {
  // Get a reference to the Firestore collection for events
  CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  // Get a reference to the Firestore collection for users
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Get the current user ID
  String currentUserID = FirebaseAuth.instance.currentUser!.uid;

  // Get the current user document reference
  DocumentReference currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(currentUserID);

  // Query the events collection for finished events that reference the current user
  QuerySnapshot finishedEventsSnapshot = await eventsCollection
      .where('isEnded', isEqualTo: true)
      .where('volunteer_ref', arrayContains: currentUserRef)
      .where('isMeritScoreUpdated',
          isEqualTo:
              false) // Only consider events that haven't had their merit scores updated yet
      .get();

  // If there are no finished events that reference the current user, return a message
  if (finishedEventsSnapshot.docs.length == 0) {
    return "None";
  }

  // Update the current user's meritScore by 5
  try {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot currentUserSnapshot =
          await transaction.get(currentUserRef);
      int currentMeritScore = currentUserSnapshot['meritScore'];
      int newMeritScore = currentMeritScore + 5;
      transaction.update(currentUserRef, {'meritScore': newMeritScore});

      // Update the 'isMeritScoreUpdated' field for each finished event that references the current user
      for (DocumentSnapshot eventSnapshot in finishedEventsSnapshot.docs) {
        DocumentReference eventRef = eventSnapshot.reference;
        transaction.update(eventRef, {'isMeritScoreUpdated': true});
      }
    });
  } on PlatformException {
    return "Error";
  }

  // Return a success message
  return "Success";
}
