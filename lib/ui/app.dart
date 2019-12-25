import 'package:flutter/material.dart';
import 'package:mm/ui/routes/app_router.dart';
import 'package:mm/ui/routes/routes.dart';

class App extends StatefulWidget {
  @override
  State createState(){
    return AppState();
  }
}

class AppState extends State<App> {  
  AppState(){
    Routes.configure(AppRouter.router);
  }

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
