// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// ...

// Set the timezone to Asia/Manila
void setTimeZone() {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Manila'));
}

// Function to check if a volunteer can join a new event
Future<bool> canVolunteerJoinEvent(
    String volunteerId, DateTime newEventStart) async {
  try {
    setTimeZone();
    final newStartDateTime = tz.TZDateTime.from(newEventStart, tz.local);
    final eventsRef = FirebaseFirestore.instance.collection('events');
    final volunteerEventsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(volunteerId)
        .collection('myEvents');

    final existingEventsSnapshot = await volunteerEventsRef.get();

    for (final doc in existingEventsSnapshot.docs) {
      final eventRef = doc.get('eventReference') as DocumentReference;
      final eventSnapshot = await eventRef.get();

      final eventStartDate = eventSnapshot.get('eventDateStart') as Timestamp;
      final eventEndDate = eventSnapshot.get('eventDateEnd') as Timestamp;

      final existingStartDateTime =
          tz.TZDateTime.from(eventStartDate.toDate(), tz.local);
      final existingEndDateTime =
          tz.TZDateTime.from(eventEndDate.toDate(), tz.local);

      final existingEndDateTimeAdd = tz.TZDateTime.from(
        eventEndDate.toDate().add(Duration(hours: 1)),
        tz.local,
      );

      // Check for conflicts
      if ((newStartDateTime.hour == existingEndDateTimeAdd.hour &&
              newStartDateTime.minute == existingEndDateTimeAdd.minute) ||
          (newStartDateTime.hour > existingStartDateTime.hour ||
                  (newStartDateTime.hour == existingStartDateTime.hour &&
                      newStartDateTime.minute >=
                          existingStartDateTime.minute)) &&
              (newStartDateTime.hour < existingEndDateTime.hour ||
                  (newStartDateTime.hour == existingEndDateTime.hour &&
                      newStartDateTime.minute <= existingEndDateTime.minute))) {
        // The new event start falls within the range of the existing event
        print('Scheduling conflict found.');
        print('Existing event reference: ${eventRef.path}');
        print(
            'Existing event start: ${DateFormat('MMMM dd, yyyy hh:mm a').format(existingStartDateTime)}');
        print(
            'Existing event end: ${DateFormat('MMMM dd, yyyy hh:mm a').format(existingEndDateTime)}');
        print(
            'New event end with add: ${DateFormat('MMMM dd, yyyy hh:mm a').format(existingEndDateTimeAdd)}');
        print(
            'New event start: ${DateFormat('MMMM dd, yyyy hh:mm a').format(newStartDateTime)}');
        return true;
      }
    }

    // No scheduling conflict found
    print('No scheduling conflict found.');
    print(
        'New event start: ${DateFormat('MMMM dd, yyyy hh:mm a').format(newStartDateTime)}');
    return false;
  } catch (error) {
    // Handle the error and print the error message
    print('Error occurred: $error');
    return false;
  }
}
