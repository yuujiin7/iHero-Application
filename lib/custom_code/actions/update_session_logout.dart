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
final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
Future<void> updateSessionLogout(String userId, DateTime? endTime) async {
  final userRef = usersCollection.doc(userId);

  // Get the user document for the current user
  final userDoc = await usersCollection.doc(userId).get();

  // Get the start time from the user document

  final startTime = (userDoc.data() as Map<String, dynamic>)['startTime'];

  Map<String, dynamic> updateData = {};

  if (endTime != null) {
    final duration = endTime.difference(startTime.toDate()).inSeconds;
    updateData['endTime'] = endTime;
    updateData['duration'] = duration;
  }

  await userRef.update(updateData);
}
