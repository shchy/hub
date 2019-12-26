import 'package:flutter/material.dart';
import 'package:mm/app.dart';
import 'package:mm/di/container.dart';
import 'package:mm/themes/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DIContainer().provide(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Application app = Provider.of<Application>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: app.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
