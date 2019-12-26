import 'package:flutter/material.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // ApiInterface api = Provider.of<ApiInterface>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                    labelText: "ID",
                    border: InputBorder.none,
                    hintText: 'Enter a ID'),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    border: InputBorder.none,
                    hintText: 'Enter a password'),
                obscureText: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
