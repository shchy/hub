import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Text('test'),
    );
  }
}
