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
  /**{
    if (newUser.correo == login[0].correo &&
        newUser.contrasena == login[0].contrasena) {
      userExist = true;
      TokenSimulator.existeToken = true;
      TokenSimulator.userToken = 'Goku';
    }

    if (newUser.correo == login[1].correo &&
        newUser.contrasena == login[1].contrasena) {
      userExist = true;
      TokenSimulator.existeToken = true;
      TokenSimulator.userToken = 'Vegeta';
    }
  }**/
}
