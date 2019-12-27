import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/app.dart';
import 'package:mm/bloc/authbloc.dart';

import 'package:mm/bloc/counterbloc.dart';
import 'package:mm/resources/debug_api.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class Bootstrap {
  Widget provide(Widget root) {
    var router = Router();
    Routes.configure(router);

    var app = Application(router);
    ApiInterface api = DebugApi();

    return MultiProvider(
      providers: [
        Provider<Application>(
          create: (context) => app,
        ),
        BlocProvider<CounterBlocInterface>(create: (context) => CounterBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(api, app)),
        Provider<ApiInterface>(
          create: (context) => api,
        )
      ],
      child: root,
    );
  }
}
