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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> checkUserReportType() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return null; // current user is not authenticated
  }

  final currentUserRef =
      FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

  final unethicalReportSnapshot = await FirebaseFirestore.instance
      .collection('unethical_illegal_conduct_report')
      .where('isDeclined', isEqualTo: false)
      .where('isConfirmedbySA', isEqualTo: true)
      .where('reported_by', isEqualTo: currentUserRef)
      .get();

  if (unethicalReportSnapshot.docs.isNotEmpty) {
    return 'unethical';
  }

  final memorializationReportSnapshot = await FirebaseFirestore.instance
      .collection('memorialization_report')
      .where('isDeclined', isEqualTo: false)
      .where('isConfirmedbySA', isEqualTo: true)
      .where('reported_by', isEqualTo: currentUserRef)
      .get();

  if (memorializationReportSnapshot.docs.isNotEmpty) {
    return 'memorialization';
  }

  final falseReportSnapshot = await FirebaseFirestore.instance
      .collection('false_information_report')
      .where('isDeclined', isEqualTo: false)
      .where('isConfirmedbySa', isEqualTo: true)
      .where('reported_by', isEqualTo: currentUserRef)
      .get();

  if (falseReportSnapshot.docs.isNotEmpty) {
    return 'falseInfo';
  }

  return ''; // no matching report found
}
