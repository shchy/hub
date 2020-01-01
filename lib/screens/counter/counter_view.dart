import 'package:flutter/material.dart';
import 'package:mm/components/app_bar.dart';
import 'package:mm/components/menu.dart';
import 'package:mm/screens/counter/counter_commands.dart';
import 'package:mm/screens/counter/counter_content.dart';

class CounterView extends StatelessWidget {
  CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Home'),
        drawer: SafeArea(
          child: Drawer(child: SideMenu()),
        ),
        body: CounterContent(),
        floatingActionButton: CounterCommands());
  }
}
