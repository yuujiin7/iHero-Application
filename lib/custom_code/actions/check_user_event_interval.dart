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
import 'dart:async';

Future<bool> checkUserEventInterval(String userId, String eventIdToJoin) async {
  try {
    // Get the user document from the "users" collection
    final userDoc =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();
    if (!userDoc.exists) {
      throw new Exception("User document not found");
    }

    // Get the "myEvents" subcollection for the user
    final myEventsCollection = userDoc.reference.collection("myEvents");

    // Check if the user has joined any events
    final joinedEvents = await myEventsCollection
        .where("eventReference", isEqualTo: eventIdToJoin)
        .get();

    print("Joined events: ${joinedEvents.docs}");

    // if (joinedEvents.docs.isEmpty) {
    //   // User has not joined this event before, return false
    //   return false;
    // }

    // Get the event document from the "events" collection
    final eventDoc = await FirebaseFirestore.instance
        .collection("events")
        .doc(eventIdToJoin)
        .get();
    if (!eventDoc.exists) {
      throw new Exception("Event document not found");
    }

    // Get the start time of the new event
    final eventStartTime = (eventDoc.data()!['eventDateStart'] as Timestamp)
        .millisecondsSinceEpoch;

    // Check if any of the joined events have a start time within one hour of the new event
    bool isJoinedEventWithin1Hour = false;
    for (final joinedEvent in joinedEvents.docs) {
      // Get the timestamp of the joined event
      final joinedEventDocRef = myEventsCollection.doc(joinedEvent.id);
      final joinedEventDoc = await joinedEventDocRef.get();
      if (!joinedEventDoc.exists) {
        throw new Exception("Joined event document not found");
      }
      final joinedEventStartTime = (await FirebaseFirestore.instance
              .collection("events")
              .doc(joinedEventDoc.data() as String?)
              .get())
          .data()!['eventDateStart']
          .millisecondsSinceEpoch;

      // Check if the joined event start time is within one hour of the new event start time
      if (joinedEventStartTime - eventStartTime <=
          Duration(hours: 1).inMilliseconds) {
        isJoinedEventWithin1Hour = true;
        break;
      }
    }

    // Return whether any of the joined events are within one hour of the new event
    return isJoinedEventWithin1Hour;
  } catch (e) {
    // Return false if there is any error
    print("Error in checkUserEventInterval: $e");
    return false;
  }
}
