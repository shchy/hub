import 'package:flutter/material.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/screens/counter/counter_commands.dart';
import 'package:mm/screens/counter/counter_content.dart';

class CounterView extends StatelessWidget {
  CounterView({Key key}) : super(key: key);

  final String title = "title";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
        ),
        drawer: SafeArea(
          child: Drawer(child: SideMenu()),
        ),
        body: CounterContent(),
        floatingActionButton: CounterCommands());
  }
}
