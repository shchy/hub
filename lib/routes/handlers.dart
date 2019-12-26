import 'package:fluro/fluro.dart';
import 'package:mm/app.dart';
import 'package:mm/screens/counter/counter.dart';
import 'package:mm/screens/login/login.dart';
import 'package:mm/screens/test/test.dart';
import 'package:provider/provider.dart';

Handler mustBeAuth(HandlerFunc handler) {
  return Handler(handlerFunc: (ctxt, prms) {
    var app = Provider.of<Application>(ctxt);
    if (app.me == null) {
      return Login();
    }
    return handler(ctxt, prms);
  });
}

var rootHandler = mustBeAuth((ctxt, prms) => Counter());
// Handler(handlerFunc: (ctxt, prms) => Counter());
var testHandler = mustBeAuth((ctxt, prms) => Test());
var loginHandler = Handler(handlerFunc: (ctxt, prms) => Login());
