import 'package:fluro/fluro.dart';

import 'handlers.dart';

class Routes {
  static String root = "/";
  static String test = "/test";
  static String login = "/login";
  static String project = "/project/:id";
  static String makeProjectPath(int id) => '/project/$id';

  static void configure(Router router) {
    router.define(login,
        handler: loginHandler, transitionType: TransitionType.cupertino);
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.cupertino);
    router.define(test,
        handler: testHandler, transitionType: TransitionType.cupertino);
    router.define(project,
        handler: projectHandler, transitionType: TransitionType.cupertino);
  }
}
