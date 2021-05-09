import 'dart:io';

import 'package:fluxstore/models/User.dart';
import 'package:fluxstore/providers/BaseProviders.dart';
import 'package:fluxstore/providers/UserProvider.dart';

class UserRepository {
  BaseUserProvider userProvider = UserProvider();

  Future<bool> signup(
    String name,
    String email,
    String address,
    String password,
    String username,
    File picture,
  ) {
    return userProvider.signup(
      name,
      email,
      address,
      password,
      username,
      picture,
    );
  }

  Future<User> login(
    String username,
    String password, {
    bool isSessionLogin,
  }) {
    return userProvider.login(username, password);
  }
}
