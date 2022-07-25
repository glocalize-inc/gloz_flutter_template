import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'firebase_options/index.dart';

late FirebaseCrashlytics crashlytics;

Future<void> initializeFirebase({
  // bool useRealtimeDatabase = true,
  bool useCrashlytics = true,
}) async {
  print(DefaultFirebaseOptions.currentPlatform);
  if (!useCrashlytics) {
    if (kDebugMode) {
      print('파이어베이스를 사용하지 않습니다.');
    }
  }

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } on FirebaseException catch (e) {
    switch (e.code) {
      case 'duplicate-app':
        Firebase.app();
        break;
      default:
        rethrow;
    }
  }

  // if (useRealtimeDatabase) {
  //   rtdb = FirebaseDatabase.instance;
  // }

  if (useCrashlytics) {
    crashlytics = FirebaseCrashlytics.instance;
  }
}
