part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class initEvent extends UserEvent {
  final User user;

  initEvent(this.user);
}

class emailEvent extends UserEvent {
  final String? email;

  emailEvent(this.email);
}

class passwordEvent extends UserEvent {
  final String? password;

  passwordEvent(this.password);
}
