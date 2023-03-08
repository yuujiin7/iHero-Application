// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference> getDocumentReference(String orgTitle) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("partnerOrg")
      .where("orgTitle", isEqualTo: orgTitle)
      .get();

  List<DocumentSnapshot> documents = querySnapshot.docs;

  if (documents.length > 0) {
    return documents[0].reference;
  } else {
    return FirebaseFirestore.instance.doc("");
  }
}
