import 'package:firebase_messaging/firebase_messaging.dart';

typedef HandleMessage = void Function(RemoteMessage);

Future<String?> setupInteractedMessage({HandleMessage? handleMessage}) async {
  // Get any messages which caused the application to open from
  // a terminated state.
  RemoteMessage? initialMessage =
  await FirebaseMessaging.instance.getInitialMessage();
  // END

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (handleMessage != null) {
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  return FirebaseMessaging.instance.getToken();
}

Future<void> deleteFcmTokenFromRealtimeDatabase() async {
  return FirebaseMessaging.instance.deleteToken();
}
