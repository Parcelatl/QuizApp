import 'package:flutter/material.dart';
import 'package:quizapp/Login/login.dart';
import 'package:quizapp/Services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/Shared/error.dart';
import 'package:quizapp/Shared/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;

    // ignore: no_leading_underscores_for_local_identifiers
    void _openEndDrawer() {
      scaffoldKey.currentState!.openEndDrawer();
    }

    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Center(
              child: ErrorMessage(),
            );
          } else if (snapshot.hasData) {
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text('Welcome!'),             //const Text('Welcome!'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: _openEndDrawer,
                      icon: const Icon(Icons.settings)),
                ],
              ),
              endDrawer: Drawer(
                backgroundColor: Colors.grey[850],
                width: screenWidth * .6,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Icon(FontAwesomeIcons.user, size: 70),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          child: const Text('Profile'),
                          onPressed: () =>
                              Navigator.pushNamed(context, '/profile')),
                    ],
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50 * 2,
                      width: 200 * 2,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/topics'),
                        icon: const Icon(Icons.play_arrow),
                        label:
                            const Text('Play', textScaler: TextScaler.linear(4)),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            );
          } else {
            return const LoginScreen();
          }
        });
  }
}
