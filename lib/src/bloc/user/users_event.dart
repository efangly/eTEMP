part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class SetUser extends UsersEvent {
  final String displayName;
  final String userPic;

  const SetUser(this.displayName, this.userPic);
}

class RemoveUser extends UsersEvent {}
