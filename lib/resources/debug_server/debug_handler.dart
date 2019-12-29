import 'package:http/http.dart';

typedef bool IsMatch(Request req);
typedef Response Handler(Request req);
var matchPath = (String path) => (Request req) => req.url.path.startsWith(path);

abstract class DebugHandler {
  IsMatch _isMatch;
  Map<String, Handler> _handlers;
  DebugHandler(this._isMatch) {
    this._handlers = makeHandlers();
  }

  Map<String, Handler> makeHandlers();

  bool isMatch(Request req) {
    if (!_isMatch(req)) return false;
    return _handlers.containsKey(req.method);
  }

  Response handler(Request req) => _handlers[req.method](req);
}
