import 'dart:io';

import 'package:fluxstore/models/Category.dart';
import 'package:fluxstore/providers/BaseProviders.dart';

class CategoryProvider extends BaseCategoryProvider {
  @override
  Future<Category> create(String name, File image) async {}

  @override
  Future<Category> update(String id, String name, File image) async {}

  @override
  Future<void> delete(String id) async {}

  @override
  Future<List<Category>> getCategories() async {}
}
