import 'package:dbstech_bloc_example/app_states.dart';
import 'package:dbstech_bloc_example/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_events.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}