import 'package:fluro/fluro.dart';

import 'handlers.dart';

class Routes{
  static String root = "/";

  static void configure(Router router){
    
    router.define(root, handler: rootHandler);
  }
}