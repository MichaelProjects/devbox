import 'dart:convert';

class ApiHelper {
  final Uri uri;
  final Map headers;
  final String payload;

  ApiHelper({this.uri, this.headers, this.payload});

  factory ApiHelper.easy(String rawUri, Map headers, Map payload) {
    if (!rawUri.contains("https")) {
      rawUri = "https://" + rawUri;
    }

    return ApiHelper(
        uri: Uri.parse(rawUri), headers: headers, payload: jsonEncode(payload));
  }
}

class ApiClient {
  Future post() async {}
  Future get() async {}
}
