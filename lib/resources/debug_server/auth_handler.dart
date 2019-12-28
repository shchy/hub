import 'dart:convert';

import 'package:http/http.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/resources/api.dart';

import 'debug_handler.dart';

class AuthHandler extends DebugHandler {
  String _secret = 'secret';

  AuthHandler() {
    method = "POST";
    path = Api.auth_path;
  }

  Response handler(Request req) {
    var payload = json.decode(req.body);
    final claimSet = JwtClaim(
        issuer: 'Me',
        subject: payload['id'],
        issuedAt: DateTime.now(),
        maxAge: const Duration(hours: 12));

    String token = issueJwtHS256(claimSet, _secret);
    return Response(token, 200);
  }
}
