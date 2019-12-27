import 'package:flutter/material.dart';
import 'package:mm/app.dart';
import 'package:mm/bloc/authbloc.dart';
import 'package:mm/routes/routes.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _id = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _id.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Application _app = Provider.of<Application>(context);
    // ignore: close_sinks
    AuthBloc _auth = Provider.of<AuthBloc>(context);

    _auth.listen((isLogin) {
      if (!isLogin) return;
      _app.router.navigateTo(context, Routes.root);
    });

    return Scaffold(
      body: Center(
        child: Container(
          width: 240,
          height: 240,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                child: TextField(
                  controller: _id,
                  decoration:
                      InputDecoration(labelText: "ID", hintText: 'Enter a ID'),
                ),
              ),
              Container(
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: 'Enter a password'),
                  obscureText: true,
                ),
              ),
              FlatButton(
                child: Text('Login'),
                onPressed: () {
                  _auth.add(LoginEvent(_id.text, _password.text));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
