import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mm/resources/debug_server/auth_handler.dart';
import 'package:mm/resources/debug_server/debug_handler.dart';

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
