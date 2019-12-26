import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/bloc/counterbloc.dart';

class CounterPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBlocInterface, int>(
      builder: (context, count) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        );
      },
    );
  }
}
