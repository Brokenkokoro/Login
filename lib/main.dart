import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/Token/simulador_token.dart';
import 'package:login/bloc/user_bloc.dart';

import 'Screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenSimulator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productos App',
          initialRoute: TokenSimulator.existeToken ? 'home' : 'login',
          routes: {
            'login': (_) => LoginScreen(),
            'home': (_) => HomeScreen(),
          }),
    );
  }
}
