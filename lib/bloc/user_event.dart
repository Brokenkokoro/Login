part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class initEvent extends UserEvent {
  final User user;

  initEvent(this.user);
}
