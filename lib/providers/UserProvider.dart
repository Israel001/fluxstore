import 'dart:io';

import 'package:fluxstore/models/User.dart';
import 'package:fluxstore/providers/BaseProviders.dart';

class UserProvider extends BaseUserProvider {
  @override
  Future<bool> signup(
    String name,
    String email,
    String address,
    String password,
    String username,
    File picture,
  ) async {}

  @override
  Future<User> login(
    String username,
    String password, {
    bool isSessionLogin,
  }) async {}
}
