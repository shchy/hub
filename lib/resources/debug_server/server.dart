import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'auth_handler.dart';
import 'debug_handler.dart';
import 'project_handler.dart';

List<DebugHandler> _routeList = [
  AuthHandler(),
  ProjectHandler(),
];

var mockClient = MockClient((req) async {
  var findIt = _routeList.firstWhere((r) => r.isMatch(req), orElse: () => null);
  if (findIt == null) {
    print('debug server:\trouting not found ${req.method} ${req.url}');
    return Response(null, 404);
  }
  print(
      "debug server:\trouting ${req.method} ${req.url} ${findIt.runtimeType} \n\t\theaders=${req.headers}");
  return findIt.handler(req);
});
