import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../authentification/authentification_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  await authService.signOut();
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Deconnexion"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
