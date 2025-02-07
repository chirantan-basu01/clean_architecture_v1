import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError('Failed to load users'));
      }
    });
  }
}
