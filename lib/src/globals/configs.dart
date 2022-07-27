// const host = 'localhost:3000';
// const serverProto = 'http';
import 'package:flutter/foundation.dart';

const host = kReleaseMode ? 'platform.glozinc.com' : 'dev.gloground.com';
const serverProto = 'https';
const uriPrefix = '$serverProto://$host';
