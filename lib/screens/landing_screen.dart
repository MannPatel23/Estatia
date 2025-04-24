import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in
          Future.microtask(() => Navigator.pushReplacementNamed(context, '/home'));
          return const SizedBox.shrink();
        } else {
          // User is not logged in
          Future.microtask(() => Navigator.pushReplacementNamed(context, '/login'));
          return const SizedBox.shrink();
        }
      },
    );
  }
}
