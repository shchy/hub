import 'package:fluro/fluro.dart';

import 'models/user.dart';

class Application {
  Application(this.router);
  Router router;
  User me;
  String token;
}
