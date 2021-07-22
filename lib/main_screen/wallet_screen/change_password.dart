import 'package:active_ageing_mobile_app/models/firebase_login.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool checkCurrentPasswordValid = true;
  var message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: 'password',
                      errorText: checkCurrentPasswordValid
                          ? null
                          : "Password is invalid"),
                ),
                TextFormField(
                  controller: newPassword,
                  decoration: InputDecoration(
                      hintText: 'new password', errorText: message),
                  validator: (value) {
                    return value == "" ? 'Password must not be null' : null;
                  },
                ),
                TextFormField(
                  controller: repeatPassword,
                  decoration: InputDecoration(
                      hintText: 'repeat password', errorText: message),
                  validator: (value) {
                    return newPassword.text == value
                        ? null
                        : 'Please validate your entered password';
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                checkCurrentPasswordValid =
                    await UserAuthen().validateCurentPassword(password.text);

                setState(() {});
                if (_formKey.currentState!.validate() &&
                    checkCurrentPasswordValid) {
                  UserAuthen()
                      .updateUserPassword(newPassword.text)
                      .then((value) {
                    if (value == 'true') {
                      final snackBar =
                          SnackBar(content: Text('Password changed!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        message = value;
                      });
                      // final snackBar = SnackBar(content: Text(value));
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                } else
                  print('Not validated');
              },
              child: Text('Save'))
        ],
      ),
    ));
  }
}
