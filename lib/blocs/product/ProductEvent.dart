import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class ProductCreateEvent extends ProductEvent {
  final String name;
  final String image;
  final String price;
  final String isActive;
  final String boughtTimes;
  final String categoryId;
  final String sellerId;
  final String description;
  final String deliverySpan;
  final String deliveryFee;
  final String discountPrice;

  ProductCreateEvent(
    this.name,
    this.image,
    this.price,
    this.isActive,
    this.boughtTimes,
    this.categoryId,
    this.sellerId,
    this.description,
    this.deliverySpan,
    this.deliveryFee,
    this.discountPrice,
  );

  @override
  List<Object> get props => [
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
      ];
}

class ProductUpdateEvent extends ProductEvent {
  final String id;
  final String name;
  final String image;
  final String price;
  final String isActive;
  final String boughtTimes;
  final String categoryId;
  final String sellerId;
  final String description;
  final String deliverySpan;
  final String deliveryFee;
  final String discountPrice;

  ProductUpdateEvent(
    this.id,
    this.name,
    this.image,
    this.price,
    this.isActive,
    this.boughtTimes,
    this.categoryId,
    this.sellerId,
    this.description,
    this.deliverySpan,
    this.deliveryFee,
    this.discountPrice,
  );

  @override
  List<Object> get props => [
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
      ];
}

class ProductDeleteEvent extends ProductEvent {
  final String id;

  ProductDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}

class ProductFetchEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}
