import 'package:bloc/bloc.dart';
import 'package:fluxstore/blocs/product/ProductEvent.dart';
import 'package:fluxstore/blocs/product/ProductState.dart';
import 'package:fluxstore/repositories/ProductRepository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({this.productRepository}) : super(InitialProductState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {}
}
