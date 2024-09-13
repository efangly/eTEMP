part of 'users_bloc.dart';

class UsersState extends Equatable {
  final String displayName;
  final String userPic;
  const UsersState({this.displayName = "", this.userPic = ""});

  UsersState copyWith({String? displayName, String? userPic}) {
    return UsersState(displayName: displayName ?? this.displayName, userPic: userPic ?? this.userPic);
  }

  @override
  List<Object> get props => [displayName, userPic];
}
