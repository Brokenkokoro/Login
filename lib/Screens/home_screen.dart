import 'package:flutter/material.dart';
import 'package:login/Token/simulador_token.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('bienvenido ${TokenSimulator.userToken}',
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
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
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  TokenSimulator.existeToken = false;
                  TokenSimulator.token = '';
                  TokenSimulator.userToken = '';

                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
            ]),
      ),
    );
  }
}
