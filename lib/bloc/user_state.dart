part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final User? user;

  const UserState({this.user});
}

class UserInitial extends UserState {
  const UserInitial() : super(user: null);
}

class SetState extends UserState {
  final User newUser;

  const SetState(this.newUser) : super(user: newUser);
}
