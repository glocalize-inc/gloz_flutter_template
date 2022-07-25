import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'development.dart' as dev;
import 'production.dart' as prod;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform => kReleaseMode
      ? prod.DefaultFirebaseOptions.currentPlatform
      : dev.DefaultFirebaseOptions.currentPlatform;
}
