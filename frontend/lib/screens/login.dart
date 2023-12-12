import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:projecto/screens/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Log In',
      theme: LoginTheme(primaryColor: Colors.blue),
      logo: AssetImage('assets/login.png'),
      onLogin: (_) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          )),
      onSignup: (_) => Future(null!),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Homepage(),
        ));
      },
      onRecoverPassword: (_) => Future(null!),
    );
  }
}
