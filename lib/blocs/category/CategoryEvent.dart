import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryEvent extends Equatable {}

class CategoryCreateEvent extends CategoryEvent {
  final String name;
  final String image;

  CategoryCreateEvent(this.name, this.image);

  @override
  List<Object> get props => [name, image];
}

class CategoryUpdateEvent extends CategoryEvent {
  final String id;
  final String name;
  final String image;

  CategoryUpdateEvent(this.id, this.name, this.image);

  @override
  List<Object> get props => [id, name, image];
}

class CategoryDeleteEvent extends CategoryEvent {
  final String id;

  CategoryDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}

class CategoryFetchEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}
