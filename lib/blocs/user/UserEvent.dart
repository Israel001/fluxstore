import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserEvent extends Equatable {}

class SignupEvent extends UserEvent {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String picture;

  SignupEvent(
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.picture,
  );

  @override
  List<Object> get props => [id, name, username, email, password, picture];
}

class LoginEvent extends UserEvent {
  final String username;
  final String password;
  final bool sessionLogin;

  LoginEvent(this.username, this.password, {this.sessionLogin = false});

  @override
  List<Object> get props => [username, password, sessionLogin];
}

class LogoutEvent extends UserEvent {
  @override
  List<Object> get props => [];
}
