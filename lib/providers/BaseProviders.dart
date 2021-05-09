import 'dart:io';

import 'package:fluxstore/models/Category.dart';
import 'package:fluxstore/models/Product.dart';
import 'package:fluxstore/models/User.dart';

abstract class BaseUserProvider {
  Future<bool> signup(
    String name,
    String email,
    String address,
    String password,
    String username,
    File picture,
  );
  Future<User> login(String username, String password, {bool isSessionLogin});
}

abstract class BaseProductProvider {
  Future<Product> create(
    String name,
    File image,
    String price,
    String isActive,
    String boughtTimes,
    String categoryId,
    String sellerId,
    String description,
    String deliverySpan,
    String deliveryFee,
    String discountPrice,
  );
  Future<Product> update(
    String id,
    String name,
    File image,
    String price,
    String isActive,
    String boughtTimes,
    String categoryId,
    String sellerId,
    String description,
    String deliverySpan,
    String deliveryFee,
    String discountPrice,
  );
  Future<void> delete(String id);
  Future<List<Product>> getProducts();
}

abstract class BaseCategoryProvider {
  Future<Category> create(String name, File image);
  Future<Category> update(String id, String name, File image);
  Future<void> delete(String id);
  Future<List<Category>> getCategories();
}
