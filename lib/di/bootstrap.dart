import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mm/app.dart';
import 'package:mm/bloc/authbloc.dart';

import 'package:mm/bloc/counterbloc.dart';
import 'package:mm/resources/data_context.dart';
import 'package:mm/resources/api.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/resources/debug_server/server.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

const bool isDebug = true;

class Bootstrap {
  Future<Widget> provide(Widget root) async {
    WidgetsFlutterBinding.ensureInitialized();

    var router = Router();
    Routes.configure(router);

    ApiInterface api;
    if (isDebug) {
      api = Api(mockClient);
    } else {
      api = Api(Client());
    }
    var app = Application();
    IDataContext dataContext = DataContext();

    app.token = await dataContext.getToken();

    return MultiProvider(
      providers: [
        Provider<Application>(
          create: (context) => app,
        ),
        Provider<IDataContext>(create: (context) => dataContext),
        Provider<Router>(create: (context) => router),
        BlocProvider<CounterBlocInterface>(create: (context) => CounterBloc()),
        BlocProvider<AuthBloc>(create: (context) {
          var authBloc = AuthBloc(api, app, dataContext);
          return authBloc;
        }),
        Provider<ApiInterface>(
          create: (context) => api,
        )
      ],
      child: root,
    );
  }
}
