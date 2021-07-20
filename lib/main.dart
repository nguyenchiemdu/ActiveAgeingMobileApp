import 'package:active_ageing_mobile_app/main_screen/main_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final MaterialColor myGreen = const MaterialColor(0xff12B281, const {
    50: const Color(0xffECF9F4),
    100: const Color(0xffECF9F4),
    200: const Color(0xffD3F1E7),
    300: const Color(0xff98E8CB),
    400: const Color(0xff5CCEA4),
    500: const Color(0xff12B281),
    600: const Color(0xff00865D),
    700: const Color(0xff006A4A),
    800: const Color(0xff004832),
    900: const Color(0xff002D1F)
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<User?>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null,
          )
        ],
        child: MaterialApp(
            title: 'Active Ageing Viet Nam',
            theme: ThemeData(
              primarySwatch: myGreen,
            ),
            home: AuthWrapper()));
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null)
      return MainScreen();
    else
      return LoginScreen();
  }
}
