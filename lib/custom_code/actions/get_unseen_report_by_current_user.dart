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

Future<DocumentReference<Map<String, dynamic>>?>
    getUnseenReportByCurrentUser() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    // User not logged in
    return null;
  }

  final currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(user.uid);

  final snapshot = await FirebaseFirestore.instance
      .collection('unethical_illegal_conduct_report')
      .where('isSeen', isEqualTo: false)
      .where('isConfirmbySA', isEqualTo: true)
      .where('report_by', isEqualTo: currentUserRef)
      .where('isDeclined', isEqualTo: false)
      .limit(1) // Limit to 1 document
      .get();

  if (snapshot.docs.isEmpty) {
    // No matching document found
    return null;
  }

  // Return the document reference of the first matching document
  return snapshot.docs.first.reference;
}
