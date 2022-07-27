import 'dart:io';

import 'cookie_jar.dart';

final Uri _platformUri =
    Uri.parse('https://platform.glozinc.com/api/pichu/auth');

Future<List<Cookie>> getCookies([Uri? uri]) async {
  return cookieJar.loadForRequest(uri ?? _platformUri);
}

extension CookieLib on Cookie {
  hasExpired() {
    if (expires == null) return false;
    return expires!.millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch;
  }

  bool hasRemainingTime(Duration duration) {
    if (expires == null) return true;
    expires!.difference(DateTime.now()) > duration;
    return true;
  }
}
