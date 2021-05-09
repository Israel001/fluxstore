import 'package:bloc/bloc.dart';
import 'package:fluxstore/blocs/category/Bloc.dart';
import 'package:fluxstore/repositories/CategoryRepository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({this.categoryRepository}) : super(InitialCategoryState());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {}
}
