import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mm/di/bootstrap.dart';
import 'package:mm/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  var boot = await Bootstrap().provide(App());
  runApp(boot);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Router _router = Provider.of<Router>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: _router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
