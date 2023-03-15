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
import 'package:firebase_auth/firebase_auth.dart';

Future<String> updateMeritScoreForCurrentUser1() async {
  // Get a reference to the Firestore collection for events
  final eventsCollection = FirebaseFirestore.instance.collection('events');

  // Get a reference to the Firestore collection for users
  final usersCollection = FirebaseFirestore.instance.collection('users');

  // Get the current user ID
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;

  // Get the current user document reference
  final currentUserRef = usersCollection.doc(currentUserID);

  // Query the events collection for finished events that reference the current user
  final finishedEventsSnapshot = await eventsCollection
      .where('isEnded', isEqualTo: true)
      .where('volunteer_ref', arrayContains: currentUserRef)
      .where('isMeritScoreUpdated', isEqualTo: false)
      .get();

  // If there are no finished events that reference the current user, return a message
  if (finishedEventsSnapshot.docs.isEmpty) {
    return "None";
  }

  // Update the current user's meritScore by 5
  try {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final currentUserSnapshot = await transaction.get(currentUserRef);
      final currentMeritScore = currentUserSnapshot['meritScore'] as int;
      final newMeritScore = currentMeritScore + 5;
      transaction.update(currentUserRef, {'meritScore': newMeritScore});

      // Update the 'isMeritScoreUpdated' field for each finished event that references the current user
      for (final eventSnapshot in finishedEventsSnapshot.docs) {
        final eventRef = eventSnapshot.reference;
        transaction.update(eventRef, {'isMeritScoreUpdated': true});
      }
    });
  } on FirebaseException catch (e) {
    // Handle any Firebase related errors
    return "FirebaseError: ${e.message}";
  } catch (e) {
    // Handle any other errors
    return "Error: $e";
  }

  // Return a success message
  return "Success";
}
