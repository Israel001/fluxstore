import 'dart:io';

import 'package:fluxstore/models/Category.dart';
import 'package:fluxstore/providers/BaseProviders.dart';
import 'package:fluxstore/providers/CategoryProvider.dart';

class CategoryRepository {
  BaseCategoryProvider categoryProvider = CategoryProvider();

  Future<Category> create(String name, File image) {
    return categoryProvider.create(name, image);
  }

  Future<Category> update(String id, String name, File image) {
    return categoryProvider.update(id, name, image);
  }

  Future<void> delete(String id) {
    return categoryProvider.delete(id);
  }

  Future<List<Category>> getCategories() {
    return categoryProvider.getCategories();
  }
}
