// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_ZdVgNP3XwBcJovl1rvJPE2eUrKhdUsE',
    appId: '1:482665333359:web:3deb4f4264754fdb33839a',
    messagingSenderId: '482665333359',
    projectId: 'expensetracker-4cb3e',
    authDomain: 'expensetracker-4cb3e.firebaseapp.com',
    storageBucket: 'expensetracker-4cb3e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJv0oNzxfFCKMUiWzHqQmwJTHKSPZPsXY',
    appId: '1:482665333359:android:1f1be150a3da245c33839a',
    messagingSenderId: '482665333359',
    projectId: 'expensetracker-4cb3e',
    storageBucket: 'expensetracker-4cb3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXnm29MmbUJN6p9LgJck58-QO7OI6QYoc',
    appId: '1:482665333359:ios:647dce92dad21b2e33839a',
    messagingSenderId: '482665333359',
    projectId: 'expensetracker-4cb3e',
    storageBucket: 'expensetracker-4cb3e.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXnm29MmbUJN6p9LgJck58-QO7OI6QYoc',
    appId: '1:482665333359:ios:257d19c8296b199a33839a',
    messagingSenderId: '482665333359',
    projectId: 'expensetracker-4cb3e',
    storageBucket: 'expensetracker-4cb3e.appspot.com',
    iosBundleId: 'com.example.expenseTracker.RunnerTests',
  );
}