import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mm/app.dart';
import 'package:mm/bloc/authbloc.dart';

import 'package:mm/bloc/counterbloc.dart';
import 'package:mm/bloc/project_bloc.dart';
import 'package:mm/resources/data_context.dart';
import 'package:mm/resources/api_service.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/resources/debug_server/server.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

const bool isDebug = true;

// hack: make DI container
class Bootstrap {
  Future<Widget> provide(Widget root) async {
    // Required to use `shared_preferences` before runApp
    WidgetsFlutterBinding.ensureInitialized();

    // router
    var router = Router();
    Routes.configure(router);

    // api service
    ApiInterface api;
    if (isDebug) {
      api = ApiService(mockClient);
    } else {
      api = ApiService(Client());
    }

    // global state
    var app = Application();

    // DB
    IDataContext dataContext = DataContext();

    // auth token
    app.token = await dataContext.getToken();

    // injection
    return MultiProvider(
      providers: [
        Provider<Application>(create: (_) => app),
        Provider<IDataContext>(create: (_) => dataContext),
        Provider<Router>(create: (_) => router),
        Provider<ApiInterface>(create: (_) => api),
        BlocProvider<CounterBlocInterface>(create: (_) => CounterBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(api, app, dataContext)),
        BlocProvider<ProjectBloc>(create: (_) => ProjectBloc(api)),
      ],
      child: root,
    );
  }
}
