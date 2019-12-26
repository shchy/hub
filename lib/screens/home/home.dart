import 'package:flutter/material.dart';
import 'package:mm/screens/home/counter_commands.dart';
import 'package:mm/screens/home/counter_content.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

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
