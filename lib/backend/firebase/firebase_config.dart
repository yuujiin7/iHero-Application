import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDShN8lkzqeJVIEXh7ockGIP-P09OgSswE",
            authDomain: "ihero-43ccd.firebaseapp.com",
            projectId: "ihero-43ccd",
            storageBucket: "ihero-43ccd.appspot.com",
            messagingSenderId: "814825895000",
            appId: "1:814825895000:web:2351e4394daae9a42d062d",
            measurementId: "G-8CYL68VXPB"));
  } else {
    await Firebase.initializeApp();
  }
}
