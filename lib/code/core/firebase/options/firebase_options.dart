// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDBWPGQ25A66nTlVkuaV6yCVtqdxcCsk1Y',
    appId: '1:597347396846:web:d353d7767fbaa9f39297ff',
    messagingSenderId: '597347396846',
    projectId: 'connectify-84573',
    authDomain: 'connectify-84573.firebaseapp.com',
    storageBucket: 'connectify-84573.appspot.com',
    measurementId: 'G-CD30VJHS5T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqpOvTSF_Zm9NSzUG8UCL2i7bS-NVLcsQ',
    appId: '1:597347396846:android:b1ec2a49aac5b3439297ff',
    messagingSenderId: '597347396846',
    projectId: 'connectify-84573',
    storageBucket: 'connectify-84573.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9f9qhJ7RiOwAFT0NzBdqUVL4WOdh47K4',
    appId: '1:597347396846:ios:cebce4b870010e329297ff',
    messagingSenderId: '597347396846',
    projectId: 'connectify-84573',
    storageBucket: 'connectify-84573.appspot.com',
    iosClientId: '597347396846-g5797nfkb68flejde7jj1t5vd7grchjk.apps.googleusercontent.com',
    iosBundleId: 'com.example.connectify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9f9qhJ7RiOwAFT0NzBdqUVL4WOdh47K4',
    appId: '1:597347396846:ios:cebce4b870010e329297ff',
    messagingSenderId: '597347396846',
    projectId: 'connectify-84573',
    storageBucket: 'connectify-84573.appspot.com',
    iosClientId: '597347396846-g5797nfkb68flejde7jj1t5vd7grchjk.apps.googleusercontent.com',
    iosBundleId: 'com.example.connectify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBWPGQ25A66nTlVkuaV6yCVtqdxcCsk1Y',
    appId: '1:597347396846:web:a38a66492c2c33029297ff',
    messagingSenderId: '597347396846',
    projectId: 'connectify-84573',
    authDomain: 'connectify-84573.firebaseapp.com',
    storageBucket: 'connectify-84573.appspot.com',
    measurementId: 'G-34VGRBC8V7',
  );
}