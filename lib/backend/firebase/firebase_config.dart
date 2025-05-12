import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB1omUodCUch-CNdbnWKYltkPjxTZshJ1M",
            authDomain: "petinn-cad67.firebaseapp.com",
            projectId: "petinn-cad67",
            storageBucket: "petinn-cad67.firebasestorage.app",
            messagingSenderId: "53432124641",
            appId: "1:53432124641:web:10f88c38e99529225b23a0",
            measurementId: "G-99H2TEC45D"));
  } else {
    await Firebase.initializeApp();
  }
}
