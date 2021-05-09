import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoryState extends Equatable {
  CategoryState();
}

class InitialCategoryState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryInProgress extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryCompleted extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryFailed extends CategoryState {
  @override
  List<Object> get props => [];
}
