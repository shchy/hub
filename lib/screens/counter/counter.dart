import 'package:flutter/material.dart';
import 'package:mm/screens/counter/counter_commands.dart';
import 'package:mm/screens/counter/counter_content.dart';

class Counter extends StatelessWidget {
  Counter({Key key}) : super(key: key);

  final String title = "title";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
        ),
        body: CounterContent(),
        floatingActionButton: CounterCommands());
  }
}
