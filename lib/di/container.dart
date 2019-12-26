
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mm/bloc/counterbloc.dart';
import 'package:provider/provider.dart';


class DIContainer {
  Widget provide(Widget app){
    return MultiProvider(
      providers: [
        BlocProvider<CounterBlocInterface>(
          create: (context) => CounterBloc()
        )
      ],
      child: app,
    );
  }
}
