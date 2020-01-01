import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:mm/models/user.dart';
import 'package:mm/resources/api_interface.dart';
import 'package:mm/resources/data_context.dart';

abstract class AuthEvent {}

class LoginEvent implements AuthEvent {
  String id;
  String password;
  LoginEvent(this.id, this.password);
}

class LogoutEvent implements AuthEvent {}

abstract class AuthState {
  bool get isLogin;
}

class NotLogin implements AuthState {
  @override
  bool get isLogin => false;
}

class LoggedIn implements AuthState {
  @override
  bool get isLogin => true;
  String token;
  User me;
  LoggedIn(this.token, this.me);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ApiInterface _api;
  IDataContext _dataContext;
  String _token;
  AuthBloc(this._api, this._dataContext, this._token);

  @override
  AuthState get initialState => _tokenToState(_token);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    AuthState next = NotLogin();
    switch (event.runtimeType) {
      case LoginEvent:
        var login = event as LoginEvent;
        var token = await _api.login(login.id, login.password);
        next = _tokenToState(token);

        if (!next.isLogin) {
          await _dataContext.setToken(null);
        } else {
          await _dataContext.setToken((next as LoggedIn).token);
        }
        yield next;
        break;
      case LogoutEvent:
        await _dataContext.setToken(null);
        yield next;
        break;
    }
  }

  AuthState _tokenToState(String token) {
    var user = _tokenToUser(token);
    if (user == null) {
      return NotLogin();
    } else {
      return LoggedIn(token, user);
    }
  }

  User _tokenToUser(String token) {
    if (token == null) {
      return null;
    }
    var tokens = token.split('.');
    if (tokens.length != 3) {
      return null;
    }

    var payload = tokens[1];
    var jwt = B64urlEncRfc7515.decodeUtf8(payload);
    var map = jsonDecode(jwt);
    return User(map['sub'], map['iss']);
  }
}
