import 'package:fluro/fluro.dart';
import 'package:mm/screens/home/home.dart';
import 'package:mm/screens/test/test.dart';

var rootHandler = Handler(handlerFunc: (ctxt, prms) => Home());
var testHandler = Handler(handlerFunc: (ctxt, prms) => Test());
