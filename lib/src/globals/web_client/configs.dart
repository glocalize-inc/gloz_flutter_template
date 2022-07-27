/// Platform API configs
// const host = 'localhost:3000';
// const serverProto = 'http';
const host = 'platform.glozinc.com';
const serverProto = 'https';
const uriPrefix = '$serverProto://$host';

const Map<String, String> publicApiHeaders = {
  'Accept': 'application/json; plain/text',
  'Content-Type': 'application/json; charset=UTF-8'
};
/// Platform API configs END

/// Cloud Functions(GCP) API configs
// const cloudFunctionHost = 'us-central1-glocalize.cloudfunctions.net';
// const gcpServerProto = 'https';
// const cloudFunctionUriPrefix = '$gcpServerProto://$cloudFunctionHost';
/// Cloud Functions(GCP) API configs END
