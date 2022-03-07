import 'package:app/authentification/authentification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomePage"),
              ElevatedButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Deconnexion"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
