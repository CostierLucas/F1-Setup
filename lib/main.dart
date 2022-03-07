import 'package:app/authentification/authentification_model.dart';
import 'package:app/authentification/authentification_page.dart';
import 'package:app/authentification/authentification_service.dart';
import 'package:app/navbar/navbar_service.dart';
import 'package:app/setup/setup_page.dart';
import 'package:app/setup/setup_services.dart';
import 'package:app/setup/setup_track_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'navbar/navbar_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavbarService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SetupService(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/navbar': (context) => const NavbarPage(),
          '/setup': (context) => SetupPage(),
          '/setupTrack': (context) => SetupTrackPage(),
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const Login() : const NavbarPage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
