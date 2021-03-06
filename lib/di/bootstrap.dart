import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mm/bloc/auth_bloc.dart';

import 'package:mm/bloc/counter_bloc.dart';
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
    Client client;
    if (isDebug) {
      client = mockClient;
    } else {
      client = Client();
    }
    // ignore: close_sinks
    AuthBloc authBloc;
    var logout = () => authBloc.add(LogoutEvent());
    var getAuthState = () => authBloc.state;
    ApiInterface api = ApiService(client, logout, getAuthState);

    // DB
    IDataContext dataContext = DataContext();

    // auth token
    var token = await dataContext.getToken();

    authBloc = AuthBloc(api, dataContext, token);
    // ignore: close_sinks
    var projectBloc = ProjectBloc(api);

    // injection
    return MultiProvider(
      providers: [
        Provider<IDataContext>(create: (_) => dataContext),
        Provider<Router>(create: (_) => router),
        Provider<ApiInterface>(create: (_) => api),
        BlocProvider<CounterBlocInterface>(create: (_) => CounterBloc()),
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<ProjectBloc>(create: (_) => projectBloc),
      ],
      child: root,
    );
  }
}
