import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/resources/api_interface.dart';

class DebugApi implements ApiInterface {
  static const String _secret = 'secret';
  @override
  Future<String> login(String id, String password) {
    final claimSet = JwtClaim(
        issuer: 'Me',
        subject: id,
        issuedAt: DateTime.now(),
        maxAge: const Duration(hours: 12));

    String token = issueJwtHS256(claimSet, _secret);
    return Future.value(token);
  }
}
