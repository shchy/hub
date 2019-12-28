import 'package:http/http.dart';

abstract class DebugHandler {
  String method;
  String path;

  bool isMatch(Request req) {
    return method == null ||
        req.method == method && req.url.path.startsWith(path);
  }

  Response handler(Request req);
}
