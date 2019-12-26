import 'package:fluro/fluro.dart';
import 'package:mm/screens/counter/counter.dart';
import 'package:mm/screens/test/test.dart';

var rootHandler = Handler(handlerFunc: (ctxt, prms) => Counter());
var testHandler = Handler(handlerFunc: (ctxt, prms) => Test());
