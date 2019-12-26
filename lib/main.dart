import 'package:flutter/material.dart';
import 'package:mm/routes/app_router.dart';
import 'package:mm/di/container.dart';
import 'package:mm/routes/routes.dart';
import 'package:mm/themes/theme.dart';

void main() {
  Routes.configure(AppRouter.router);
  runApp(DIContainer().provide(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: AppRouter.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
