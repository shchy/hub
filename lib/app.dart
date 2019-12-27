import 'dart:convert';

import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'models/user.dart';

class Application {
  String _token;
  User _me;

  Application();

  User get me => _me;
  String get token => _token;

  set token(String token) {
    if (token == null) {
      clear();
      return;
    }
    var payload = token.split('.')[1];
    var jwt = B64urlEncRfc7515.decodeUtf8(payload);
    var map = jsonDecode(jwt);
    _me = User(id: map['sub'], name: map['iss']);
    _token = token;
  }

  void clear() {
    _me = null;
    _token = null;
  }
}
