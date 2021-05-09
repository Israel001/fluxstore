import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductState extends Equatable {
  ProductState();
}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductInProgress extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductCompleted extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFailed extends ProductState {
  @override
  List<Object> get props => [];
}
