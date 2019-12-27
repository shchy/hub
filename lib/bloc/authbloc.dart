import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/app.dart';
import 'package:mm/models/user.dart';
import 'package:mm/resources/api_interface.dart';

abstract class AuthEvent {}

class LoginEvent implements AuthEvent {
  String id;
  String password;
  LoginEvent(this.id, this.password);
}

class LogoutEvent implements AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, bool> {
  ApiInterface _api;
  Application _app;
  AuthBloc(this._api, this._app);

  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(AuthEvent event) async* {
    switch (event.runtimeType) {
      case LoginEvent:
        var login = event as LoginEvent;
        var token = await _api.login(login.id, login.password);
        if (token == null) {
          yield false;
        } else {
          var payload = token.split('.')[1];
          var jwt = B64urlEncRfc7515.decodeUtf8(payload);
          var map = jsonDecode(jwt);
          _app.me = User(id: map['sub'], name: map['iss']);
          _app.token = token;
          yield true;
        }
        break;
      case LogoutEvent:
        _app.token = null;
        _app.me = null;
        yield false;
        break;
    }
  }
}
