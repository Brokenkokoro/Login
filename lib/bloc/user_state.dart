part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final List<User> login = [
    User(email: 'goku@gmail.com', password: '123'),
    User(email: 'vegeta@gmail.com', password: '321')
  ];
  bool userExist = false;
  final User? user;

  UserState({this.user});
}

class UserInitial extends UserState {
  UserInitial() : super(user: User(email: "", password: ""));
}

class SetState extends UserState {
  final User newUser;

  SetState(this.newUser) : super(user: newUser);
}

class SetUserExistState extends UserState {
  final bool newUserExist;
  SetUserExistState(this.newUserExist);
}
