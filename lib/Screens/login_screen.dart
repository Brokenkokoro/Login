import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Models/models.dart';
import 'package:login/Token/simulador_token.dart';
import 'package:login/Widgets/widgets.dart';

import '../bloc/user_bloc.dart';
import '../ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  List<Usuario> login;
  LoginScreen({super.key, required this.login});

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
                      builder: (_, state) {
                        return _LoginForm(user: state.user, login: login);
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
  User? user;
  List<Usuario> login;

  _LoginForm({this.user, required this.login});
  @override
  Widget build(BuildContext context) {
    String pass = '';
    String correo = '';
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onFieldSubmitted: (value) {},
              validator: (value) {
                correo = value ?? correo;

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
              validator: (value) {
                pass = value ?? pass;

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
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  final user2 = User(correo: correo, contrasena: pass);
                  BlocProvider.of<UserBloc>(context).add(initEvent(user2));
                  if (user?.contrasena == login[0].contrasena &&
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
                  }
                })
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