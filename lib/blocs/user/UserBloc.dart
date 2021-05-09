import 'package:bloc/bloc.dart';
import 'package:fluxstore/blocs/user/UserEvent.dart';
import 'package:fluxstore/blocs/user/UserState.dart';
import 'package:fluxstore/repositories/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({this.userRepository}) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {}
}
