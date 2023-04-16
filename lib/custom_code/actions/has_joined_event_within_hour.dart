// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> hasJoinedEventWithinHour(
    String userId, DocumentReference newEventRef) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

  // Get the new event's start date
  final newEventDoc = await newEventRef.get();
  final newEvent = newEventDoc.data() as Map<String, dynamic>;
  final newEventDateStart =
      DateTime.parse(newEvent['eventDateStart'] as String);

  // Calculate the latest time the user can join an event to meet the 1-hour requirement
  final latestJoinTime = newEventDateStart.subtract(const Duration(hours: 1));

  // Query the events collection to find events that the user has joined in the past
  final eventsQuerySnapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('volunteer_ref', arrayContains: userId)
      .get();

  // Check each previously joined event to see if it is within the 1-hour requirement
  for (final eventDoc in eventsQuerySnapshot.docs) {
    final eventData = eventDoc.data();
    final eventDateStart =
        DateTime.parse(eventData['eventDateStart'] as String);

    // Check if the event has ended
    if (eventData['isEnded'] as bool) {
      continue; // Skip the event if it has ended
    }

    // Check if the event is within the 1-hour requirement
    if (eventDateStart.isAfter(latestJoinTime)) {
      return true; // User has joined an event within 1 hour
    }
  }

  // Check the user's previously joined events in the myEvents subcollection
  final myEventsQuerySnapshot = await userRef.collection('myEvents').get();
  for (final doc in myEventsQuerySnapshot.docs) {
    final joinedEventRef = doc.data()['eventReference'] as DocumentReference;

    // Get the start date of the joined event from the events collection
    final joinedEventDoc = await joinedEventRef.get();
    final joinedEventData = joinedEventDoc.data() as Map<String, dynamic>;
    final joinedEventDateStart =
        DateTime.parse(joinedEventData['eventDateStart'] as String);

    // Check if the event has ended
    if (joinedEventData['isEnded'] as bool) {
      continue; // Skip the joined event if it has ended
    }

    // Check if the joined event is within the 1-hour requirement
    if (joinedEventDateStart.isAfter(latestJoinTime)) {
      return true; // User has joined an event within 1 hour
    }
  }
  return false; // User has not joined an event within 1 hour
}
