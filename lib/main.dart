import 'dart:async';

import 'package:active_ageing_mobile_app/main_screen/main_screen.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen/loading_screen.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/sign_up_screen/sign_up_infor.dart';
import 'login_screen/sign_up_screen/verification_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          ChangeNotifierProvider(create: (context) => UserAuthen()),
          StreamProvider<User?>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null,
          ),
        ],
        child: MaterialApp(
            title: 'Active Ageing Vietnam',
            theme: ThemeData(
              primarySwatch: myGreen,
            ),
            home: AuthWrapper()));
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late bool isUserEmailVerified;
  Timer? timer = null;

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Future getUserData() async {
    return await UserDatabase().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final provider = Provider.of<UserAuthen>(context);
    if (provider.isSigningIn) {
      return buildLoading();
    }

    if (user != null) {
      // print('isUserEmailVerified : ' + provider.isUserEmailVerified.toString());
      return StreamProvider<DocumentSnapshot?>(
        create: (context) => FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        initialData: null,
        child: SignedInWrapper(),
      );
    } else
      return LoginScreen();
  }
}

class SignedInWrapper extends StatelessWidget {
  SignedInWrapper({Key? key}) : super(key: key);
  Timer? timer = null;
  cancelTimer() {
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final provider = Provider.of<UserAuthen>(context);
    final userSnap = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic>? userData = userSnap == null ? null : userSnap.data();
    // print('isUserEmailVerified : ' + provider.isUserEmailVerified.toString());
    if (provider.isUserEmailVerified != true &&
        user!.providerData[0].providerId != 'google.com') {
      if (timer == null) {
        timer = Timer.periodic(Duration(seconds: 5), (timer) async {
          print('Timer is running');
          var user = FirebaseAuth.instance.currentUser;
          await user.reload();
          if (user.emailVerified) {
            cancelTimer();
            provider.changeEmailVerification(true);
          }
        });
      }

      return VerificationScreen(cancelTimer);
    }
    // print('userdata:' + userData.toString());
    if (userData == null) return SignUpInforScreen();
    return MainScreen();
  }
}
