import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBbxAzhQEe7AGg8BhT30xWA6AUP0OQxOZs",
            authDomain: "akihabaradb.firebaseapp.com",
            projectId: "akihabaradb",
            storageBucket: "akihabaradb.appspot.com",
            messagingSenderId: "106288481801",
            appId: "1:106288481801:web:d522fbbb04b97696105ad8"));
  } else {
    await Firebase.initializeApp();
  }
}
