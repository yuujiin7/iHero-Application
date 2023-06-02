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

// Function to check if a volunteer can join a new event
Future<bool> canVolunteerJoinEvent(
    String volunteerId, DateTime newEventStart) async {
  final eventsRef = FirebaseFirestore.instance.collection('events');
  final volunteerEventsRef = FirebaseFirestore.instance
      .collection('users')
      .doc(volunteerId)
      .collection('myEvents');

  final existingEventsSnapshot = await volunteerEventsRef
      .where('dateJoined',
          isGreaterThanOrEqualTo: newEventStart.subtract(Duration(hours: 1)))
      .get();

  for (final doc in existingEventsSnapshot.docs) {
    final eventRef = doc.get('eventReference') as DocumentReference;
    final eventSnapshot = await eventRef.get();

    final eventStartDate = eventSnapshot.get('eventDateStart') as Timestamp;
    final eventStartDateTime = eventStartDate.toDate();

    if (newEventStart.difference(eventStartDateTime).inHours < 1) {
      // There is a scheduling conflict
      return false;
    }
  }

  // No scheduling conflict found
  return true;
}
