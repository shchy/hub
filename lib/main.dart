import 'package:flutter/material.dart';
import 'package:mm/routes/app_router.dart';
import 'package:mm/di/container.dart';
import 'package:mm/routes/routes.dart';

void main() {
  Routes.configure(AppRouter.router);
  runApp(DIContainer().provide(App()));
}

class App extends StatefulWidget {
  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
