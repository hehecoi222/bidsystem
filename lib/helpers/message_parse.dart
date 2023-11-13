import 'dart:convert';

String parseMessage(String body) {
  try {
    return jsonDecode(body)['message'];
  } catch (e) {
    return body;
  }
}