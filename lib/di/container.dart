import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/app.dart';

import 'package:mm/bloc/counterbloc.dart';
import 'package:mm/resources/debug_api.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class DIContainer {
  Widget provide(Widget app) {
    var router = Router();
    Routes.configure(router);

    return MultiProvider(
      providers: [
        Provider<Application>(
          create: (context) => Application(router),
        ),
        BlocProvider<CounterBlocInterface>(create: (context) => CounterBloc()),
        Provider<ApiInterface>(
          create: (context) => DebugApi(),
        )
      ],
      child: app,
    );
  }
}
