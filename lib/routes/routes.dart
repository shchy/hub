import 'package:fluro/fluro.dart';

import 'handlers.dart';

class Routes {
  static String root = "/";
  static String test = "/test";

  static void configure(Router router) {
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.cupertino);
    router.define(test,
        handler: testHandler, transitionType: TransitionType.cupertino);
  }
}
