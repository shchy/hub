import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mm/bloc/auth_bloc.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Router router = Provider.of<Router>(context);
    // ignore: close_sinks
    final AuthBloc _authBloc = Provider.of<AuthBloc>(context);

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // DrawerHeader(
        //   decoration: BoxDecoration(
        //     color: Colors.blue,
        //   ),
        //   child: Text(
        //     'Drawer Header',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 24,
        //     ),
        //   ),
        // ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () => router.navigateTo(context, Routes.root, replace: true),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Projects'),
          onTap: () => router.navigateTo(context, Routes.test, replace: true),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        ListTile(
          leading: Icon(Icons.all_out),
          title: Text('Logout'),
          onTap: () {
            router.pop(context);
            _authBloc.add(LogoutEvent());
          },
        ),
      ],
    );
  }
}
