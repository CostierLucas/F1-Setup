import 'package:app/authentification/authentification_model.dart';
import 'package:app/authentification/authentification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("F1 SETUP"),
              const Text("Login"),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    await authService.signInWithEmailAndPassword(
                        email: email.text.trim(),
                        password: password.text.trim());

                    if (ErrorRegister.error != "none") {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Login Error"),
                          content: Text(ErrorRegister.error),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, '/navbar');
                    }
                  },
                  child: const Text("Login"),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/register');
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final email = TextEditingController();
    final password = TextEditingController();
    final pseudo = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: pseudo,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pseudo',
                    ),
                  ),
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      await authService.createUserWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text.trim());

                      if (ErrorRegister.error != "none") {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Error Register"),
                            content: Text(ErrorRegister.error),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Ok"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: const Text("register"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
