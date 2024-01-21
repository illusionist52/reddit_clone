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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB_KjdTZh7W3juXnKGB9J_vZLU2TOI2Ue0',
    appId: '1:726331731854:web:56d73b5cd2cd9e90cd7edf',
    messagingSenderId: '726331731854',
    projectId: 'reddit-clone-27992',
    authDomain: 'reddit-clone-27992.firebaseapp.com',
    storageBucket: 'reddit-clone-27992.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKzpQpMHUBfim0Wu14lrJUQeub5jXLc3Y',
    appId: '1:726331731854:android:77dcf57ee3aa0e7ecd7edf',
    messagingSenderId: '726331731854',
    projectId: 'reddit-clone-27992',
    storageBucket: 'reddit-clone-27992.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPJVe2tV7wLP9PSvuAmRDT6H59_p29GpM',
    appId: '1:726331731854:ios:43e23ca9a6798367cd7edf',
    messagingSenderId: '726331731854',
    projectId: 'reddit-clone-27992',
    storageBucket: 'reddit-clone-27992.appspot.com',
    iosBundleId: 'com.example.redditClone',
  );
}
