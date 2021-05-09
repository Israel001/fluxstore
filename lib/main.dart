import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/blocs/category/Bloc.dart';
import 'package:fluxstore/blocs/product/Bloc.dart';
import 'package:fluxstore/blocs/user/Bloc.dart';
import 'package:fluxstore/pages/home.dart';
import 'package:fluxstore/repositories/CategoryRepository.dart';
import 'package:fluxstore/repositories/ProductRepository.dart';
import 'package:fluxstore/repositories/UserRepository.dart';

void main() async {
  final UserRepository userRepository = UserRepository();
  final ProductRepository productRepository = ProductRepository();
  final CategoryRepository categoryRepository = CategoryRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserBloc(userRepository: userRepository),
      ),
      BlocProvider(
        create: (context) => ProductBloc(productRepository: productRepository),
      ),
      BlocProvider(
        create: (context) =>
            CategoryBloc(categoryRepository: categoryRepository),
      ),
    ],
    child: FluxStore(),
  ));
}

class FluxStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluxStore',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
