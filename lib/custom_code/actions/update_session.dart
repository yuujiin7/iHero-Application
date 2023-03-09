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
Future<void> updateSession(
  String userId,
  DateTime startTime,
  DateTime? endTime,
  String deviceType,
  String screenName,
) async {
  final userRef = usersCollection.doc(userId);

  Map<String, dynamic> updateData = {
    'startTime': startTime,
    'deviceType': deviceType,
    'screenName': screenName,
  };

  if (endTime != null) {
    final duration = endTime.difference(startTime).inSeconds;
    updateData['endTime'] = endTime;
    updateData['duration'] = duration;
  }

  // await userRef.update(updateData);
  // // Update isOnline field based on last activity time
  // bool isOnline = DateTime.now().difference(startTime).inMinutes <
  //     5; // User is considered online if their session was started within the last 5 minutes
  // await userRef.update({'isOnline': isOnline});
  // // Update isActive field based on start time
  // bool isActive = DateTime.now().difference(startTime).inDays <
  //     30; // User is considered active if their session was started within the last 30 days
  // await userRef.update({'isActive': isActive});
}
