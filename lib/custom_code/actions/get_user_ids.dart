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
Future<List<String>> getUserIds() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').get();
  List<String> userIds = [];
  snapshot.docs.forEach((doc) {
    userIds.add(doc.get('uid'));
  });
  return userIds;
}
