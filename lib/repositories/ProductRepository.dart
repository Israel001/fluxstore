import 'dart:io';

import 'package:fluxstore/models/Product.dart';
import 'package:fluxstore/providers/BaseProviders.dart';
import 'package:fluxstore/providers/ProductProvider.dart';

class ProductRepository {
  BaseProductProvider productProvider = ProductProvider();

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
  ) {
    return productProvider.create(
      name,
      image,
      price,
      isActive,
      boughtTimes,
      categoryId,
      sellerId,
      description,
      deliverySpan,
      deliveryFee,
      discountPrice,
    );
  }

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
  ) {
    return productProvider.update(
      id,
      name,
      image,
      price,
      isActive,
      boughtTimes,
      categoryId,
      sellerId,
      description,
      deliverySpan,
      deliveryFee,
      discountPrice,
    );
  }

  Future<void> delete(String id) {
    return productProvider.delete(id);
  }

  Future<List<Product>> getProducts() {
    return productProvider.getProducts();
  }
}
