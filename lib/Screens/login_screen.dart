import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Models/models.dart';
import 'package:login/Widgets/widgets.dart';

import '../Token/simulador_token.dart';
import '../bloc/user_bloc.dart';
import '../ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Login',
                        style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 30),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return _LoginForm(
                            login: state.login,
                            user: state.user,
                            validator: state.userExist);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<User> login;
  User? user;
  bool validator;
  _LoginForm({this.user, required this.validator, required this.login});

  @override
  Widget build(BuildContext context) {
    String? email = user?.email;
    String password = "";
    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.values.last,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => password = value,
              validator: (value) {
                return (value != null && value.length >= 3)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                onPressed: () {
                  if (email == login[0].email &&
                      password == login[0].password) {
                    BlocProvider.of<UserBloc>(context, listen: false)
                        .add(emailEvent(email));
                    BlocProvider.of<UserBloc>(context)
                        .add(passwordEvent(password));
                    TokenSimulator.existeToken = true;
                    TokenSimulator.userToken = 'Goku';

                    Navigator.pushReplacementNamed(context, 'home');
                  }

                  if (email == login[1].email &&
                      password == login[1].password) {
                    BlocProvider.of<UserBloc>(context, listen: false)
                        .add(emailEvent(email));
                    BlocProvider.of<UserBloc>(context)
                        .add(passwordEvent(password));
                    TokenSimulator.existeToken = true;
                    TokenSimulator.userToken = 'vegeta';

                    Navigator.pushReplacementNamed(context, 'home');
                  }
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ));
  }
}

 /**onPressed: loginForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();
                
                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;

                await Future.delayed(Duration(seconds: 2 ));

                // TODO: validar si el login es correcto
                
                loginForm.isLoading = false;

                
              }**/

               /** if (user?.contrasena == login[0].contrasena &&
                      user?.correo == login[0].correo) {
                    TokenSimulator.existeToken = true;
                    TokenSimulator.token = login[0].token;
                    TokenSimulator.userToken = 'Goku';

                    Navigator.pushReplacementNamed(context, 'home');
                  }
                  if (user?.contrasena == login[1].contrasena &&
                      user?.correo == login[1].correo) {
                    TokenSimulator.existeToken = true;
                    TokenSimulator.token = login[1].token;
                    TokenSimulator.userToken = 'Vegeta';

                    Navigator.pushReplacementNamed(context, 'home');
                  }**/