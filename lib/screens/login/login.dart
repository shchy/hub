import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mm/bloc/auth_bloc.dart';
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
    Router _router = Provider.of<Router>(context);
    // ignore: close_sinks
    AuthBloc _auth = Provider.of<AuthBloc>(context);

    var login = () {
      _auth.add(LoginEvent(_id.text, _password.text));
      _router.navigateTo(context, Routes.root);
    };

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
                  onSubmitted: (_) => login(),
                ),
              ),
              Container(
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: 'Enter a password'),
                  obscureText: true,
                  onSubmitted: (_) => login(),
                ),
              ),
              FlatButton(
                child: Text('Login'),
                onPressed: login,
              )
            ],
          ),
        ),
      ),
    );
  }
}
