import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/auth_bloc.dart';
import 'package:mm/bloc/counter_bloc.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class CounterCommands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final AuthBloc _authBloc = Provider.of<AuthBloc>(context);
    // ignore: close_sinks
    final CounterBlocInterface counterBloc =
        BlocProvider.of<CounterBlocInterface>(context);
    final Router router = Provider.of<Router>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            heroTag: 'inc',
            child: Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterEvent.increment);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            heroTag: 'dec',
            child: Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(CounterEvent.decrement);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            heroTag: 'test',
            child: Icon(Icons.router),
            onPressed: () {
              router.navigateTo(context, Routes.test);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            heroTag: 'logout',
            child: Icon(Icons.exit_to_app),
            onPressed: () {
              _authBloc.add(LogoutEvent());
              router.navigateTo(context, Routes.login);
            },
          ),
        ),
      ],
    );
  }
}
