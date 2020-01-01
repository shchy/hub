import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/auth_bloc.dart';
import 'package:mm/bloc/project_bloc.dart';
import 'package:mm/models/project.dart';
import 'package:mm/screens/counter/counter_view.dart';
import 'package:mm/screens/login/login_view.dart';
import 'package:mm/screens/project/project_list_view.dart';
import 'package:mm/screens/project/project_view.dart';

HandlerFunc mustBeAuth(HandlerFunc handler) {
  return (ctxt, prms) =>
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state == null || !state.isLogin) return LoginView();
        return handler(ctxt, prms);
      });
}

var rootHandler =
    Handler(handlerFunc: mustBeAuth((ctxt, prms) => CounterView()));
var testHandler =
    Handler(handlerFunc: mustBeAuth((ctxt, prms) => ProjectListView()));
var loginHandler = Handler(handlerFunc: (ctxt, prms) => LoginView());

var projectHandler = Handler(handlerFunc: mustBeAuth((ctxt, prms) {
  return BlocBuilder<ProjectBloc, Iterable<Project>>(
      builder: (context, projects) {
    var id = int.parse(prms['id'].first);
    var project = projects.firstWhere((x) => x.id == id);
    return ProjectView(project);
  });
}));
