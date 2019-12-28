import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/resources/api.dart';

abstract class DebugHandler {
  String method;
  String path;

  bool isMatch(Request req) {
    return method == null ||
        req.method == method && req.url.path.startsWith(path);
  }

  Response handler(Request req);
}

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

List<DebugHandler> routeList = [
  AuthHandler(),
];

var mockClient = MockClient((req) async {
  var findIt = routeList.firstWhere((r) => r.isMatch(req));
  if (findIt == null) {
    return Response(null, 404);
  }
  return findIt.handler(req);
});
