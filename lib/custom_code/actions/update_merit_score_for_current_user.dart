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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

// Define the custom function
Future<String> updateMeritScoreForCurrentUser() async {
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
    });
  } on PlatformException catch (error) {
    return "Error";
  }

  // Return a success message
  return "Success";
}
