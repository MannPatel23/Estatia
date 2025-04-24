import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/list_property_screen.dart';
import 'screens/root_nav_screen.dart';
import 'screens/landing_screen.dart';
import 'providers/property_provider.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBWVrFMNPZcp5blD1Uxv4bhZKWp2rwKEmo",
        authDomain: "miniproject-9d9a1.firebaseapp.com",
        projectId: "miniproject-9d9a1",
        storageBucket: "miniproject-9d9a1.firebasestorage.app",
        messagingSenderId: "117606502218",
        appId: "1:117606502218:web:f0ded0eb3f0ddb4b167bb3",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const EstatiaApp());
}

class EstatiaApp extends StatelessWidget {
  const EstatiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PropertyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESTATIA',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/login':
              builder = (_) => const LoginScreen();
              break;
            case '/register':
              builder = (_) => const RegisterScreen();
              break;
            case '/home':
              builder = (_) => const RootNavScreen();
              break;
            case '/list':
              builder = (_) => const ListPropertyScreen();
              break;
            default:
              builder = (_) => const LandingScreen();
          }
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder(context),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
