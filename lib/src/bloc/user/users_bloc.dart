import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required UsersState initialState}) : super(initialState) {
    on<SetUser>((event, emit) async {
      emit(state.copyWith(displayName: event.displayName, userPic: event.userPic));
    });
    on<RemoveUser>((event, emit) {
      emit(state.copyWith(displayName: '', userPic: '/img/default-pic.png'));
    });
  }
}
