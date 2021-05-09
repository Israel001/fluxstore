import 'dart:io';

import 'package:fluxstore/models/Product.dart';
import 'package:fluxstore/providers/BaseProviders.dart';

class ProductProvider extends BaseProductProvider {
  @override
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
  ) async {}

  @override
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
  ) async {}

  @override
  Future<void> delete(String id) async {}

  @override
  Future<List<Product>> getProducts() async {}
}
