import 'dart:convert';

import 'package:http/http.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/resources/api_service.dart';

import 'debug_handler.dart';

class AuthHandler extends DebugHandler {
  String _secret = 'secret';

  AuthHandler() : super(matchPath(ApiService.auth_path));

  @override
  Map<String, Handler> makeHandlers() => {
        'POST': handler,
      };

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
