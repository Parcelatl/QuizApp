import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/Services/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/QuizQuest.ico', scale: 1),
              Flexible(
                child: LoginButton(
                  icon: FontAwesomeIcons.userNinja,
                  text: 'Continue as Quest',
                  loginMethod: AuthService().anonLogin,
                  color: Colors.deepPurple,
                ),
              ),
              LoginButton(
                color: Colors.red,
                icon: FontAwesomeIcons.google,
                text: 'Google Sign-In',
                loginMethod: AuthService().googleLogin,
              ),
              FutureBuilder<Object>(
                future: SignInWithApple.isAvailable(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return SignInWithAppleButton(
                      onPressed: () {
                        AuthService().signInWithApple();
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          )),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.loginMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text),
      ),
    );
  }
}
