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

Future<List<DocumentReference>> getNearEvents(String userId) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
  final userDoc = await userRef.get();
  final userType = userDoc.data()?['userType'] as String;

  if (userType != 'Admin' && userType != 'SuperAdmin') {
    // User is not authorized, return empty list
    return [];
  }

  final querySnapshot = await userRef.collection('myEvents').get();
  final events = <DocumentReference>[];

  for (final doc in querySnapshot.docs) {
    final eventRef = doc.data()['eventReference'] as DocumentReference;

    final eventDoc = await FirebaseFirestore.instance
        .collection('events')
        .doc(eventRef.id)
        .get();
    final event = eventDoc.data() as Map<String, dynamic>;

    final minimumVolunteer = event['minimumVolunteer'] as int;
    final volunteer_count = event['volunteer_count'] as int?;
    final registrationDate =
        DateTime.parse(event['registrationDate'] as String);

    if (minimumVolunteer > (volunteer_count ?? 0)) {
      final now = DateTime.now();
      final twoDaysFromNow = now.add(const Duration(days: 2));
      final oneDayFromNow = now.add(const Duration(days: 1));

      if (registrationDate.isBefore(twoDaysFromNow) &&
          registrationDate.isAfter(oneDayFromNow)) {
        events.add(eventRef);
      }
    }
  }

  return events;
}
