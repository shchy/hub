import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mm/di/bootstrap.dart';
import 'package:mm/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  var boot = await Bootstrap().provide(App());
  runApp(boot);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Router _router = Provider.of<Router>(context);

    var _generator = (RouteSettings routeSettings) {
      print('path=${routeSettings.name}, prms=${routeSettings.arguments}');
      return _router.generator(routeSettings);
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      onGenerateRoute: _generator,
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
    );
  }
}
