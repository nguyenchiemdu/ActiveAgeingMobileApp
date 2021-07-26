import 'dart:async';

import 'package:active_ageing_mobile_app/main_screen/main_screen.dart';
import 'package:active_ageing_mobile_app/models/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  Future<Map<String, dynamic>?> getUserData() async {
    if (FirebaseAuth.instance.currentUser == null) return null;
    //String uid = FirebaseAuth.instance.currentUser.uid;
    return await UserDatabase().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // FutureProvider<Map<String, dynamic>?>(
          //     create: (context) => getUserData(), initialData: null),
          StreamProvider<DocumentSnapshot?>(
            create: (context) => FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
            initialData: null,
          ),
          Provider(create: (context) => FirebaseAuth.instance.currentUser),
          StreamProvider<User?>(
            create: (context) => FirebaseAuth.instance.authStateChanges(),
            initialData: null,
          )
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
  bool isUserEmailVerified = FirebaseAuth.instance.currentUser != null
      ? FirebaseAuth.instance.currentUser.emailVerified
      : false;
  late Timer timer;
  @override
  void initState() {
    // print('dang init state');
    // print(FirebaseAuth.instance.currentUser);
    super.initState();
  }

  updateVerifyEmail(bool status) {
    // print('updateVerifyEmail');
    setState(() {
      isUserEmailVerified = status;
    });
  }

  cancelTimer() {
    print('dang cancel timer');
    timer.cancel();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future getUserData() async {
    //String uid = FirebaseAuth.instance.currentUser.uid;
    return await UserDatabase().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // print('vong ngoai ' + isUserEmailVerified.toString());
    // print(FirebaseAuth.instance.currentUser);
    final user = Provider.of<User?>(context);
    if (user != null) {
      print(isUserEmailVerified);
      // print(user.providerData[0].providerId);
      Map<String, dynamic>? userData =
          Provider.of<DocumentSnapshot?>(context) != null
              ? Provider.of<DocumentSnapshot?>(context)!.data()
              : null;
      if (isUserEmailVerified != true &&
          user.providerData[0].providerId != 'google.com') {
        timer = Timer.periodic(Duration(seconds: 5), (timer) async {
          print('Timer is still running');
          var user = FirebaseAuth.instance.currentUser;
          await user.reload();
          if (user.emailVerified) {
            print('sap setsate');
            cancelTimer();
            setState(() {
              isUserEmailVerified = user.emailVerified;
            });
          }
        });

        return VerificationScreen(cancelTimer);
      }
      // print('userData :' + userData.toString());
      // ignore: unnecessary_null_comparison
      if (userData == null) return SignUpInforScreen();
      return MainScreen();
    } else
      return LoginScreen(updateVerifyEmail);
  }
}
