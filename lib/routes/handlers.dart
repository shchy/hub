import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/app.dart';
import 'package:mm/bloc/auth_bloc.dart';
import 'package:mm/screens/counter/counter_view.dart';
import 'package:mm/screens/login/login_view.dart';
import 'package:mm/screens/project/project_view.dart';
import 'package:provider/provider.dart';

HandlerFunc mustBeAuth(HandlerFunc handler) {
  return (ctxt, prms) {
    var app = Provider.of<Application>(ctxt);
    if (app.token == null) {
      return LoginView();
    }
    return handler(ctxt, prms);
  };
}

HandlerFunc unauthorized(HandlerFunc handler) {
  return (context, prms) {
    return BlocBuilder<AuthBloc, bool>(builder: (context, isLogin) {
      if (!isLogin) return LoginView();
      return handler(context, prms);
    });
  };
}

var rootHandler = Handler(
    handlerFunc: unauthorized(mustBeAuth((ctxt, prms) => CounterView())));
var testHandler = Handler(
    handlerFunc: unauthorized(mustBeAuth((ctxt, prms) => ProjectView())));
var loginHandler =
    Handler(handlerFunc: unauthorized((ctxt, prms) => LoginView()));
