import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import 'cookie_jar.dart';

late Dio dio;

Dio createFileStorageBasedDio(
    {String? cookiePath,
      BaseOptions? baseOptions,
      int? connectTimeout = 5000,
      int? sendTimeout = 5000,
      int? receiveTimeout = 5000}) {
  Dio _dio = Dio(BaseOptions(
      contentType: ContentType.json.value,
      connectTimeout: connectTimeout,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout));
  cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));

  _dio.interceptors.add(CookieManager(cookieJar));
  dio = _dio;
  return _dio;
}
