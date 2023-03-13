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

Future<DocumentReference?> getMemorializationReportRef() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return null;
  }

  final currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

  final memorializationReportSnapshot = await FirebaseFirestore.instance
      .collection('memorialization_report')
      .where('isDeclined', isEqualTo: false)
      .where('isConfirmedbySA', isEqualTo: true)
      .where('reported_by', isEqualTo: currentUserRef)
      .where('isSeen', isEqualTo: false)
      .get();

  if (memorializationReportSnapshot.docs.isEmpty) {
    return null;
  }

  return memorializationReportSnapshot.docs.first.reference;
}
