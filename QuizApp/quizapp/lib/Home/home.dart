import 'package:flutter/material.dart';
import 'package:quizapp/Login/login.dart';
import 'package:quizapp/Services/auth.dart';
import 'package:quizapp/Shared/error.dart';
import 'package:quizapp/Shared/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    //double screenWidth = MediaQuery.of(context).size.width;
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
                // actions: [
                //   IconButton(
                //       onPressed: _openEndDrawer,
                //       icon: const Icon(Icons.settings)),
                // ],
              ),
              // endDrawer: Drawer(
              //   backgroundColor: Colors.grey[850],
              //   width: screenWidth * .6,
              //   child: Center(
              //     child: Column(
              //       children: [
              //         const SizedBox(height: 50),
              //         const Icon(FontAwesomeIcons.user, size: 70),
              //         const SizedBox(height: 50),
              //         ElevatedButton(
              //             child: const Text('Profile'),
              //             onPressed: () =>
              //                 Navigator.pushNamed(context, '/profile')),
              //       ],
              //     ),
              //   ),
              // ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset('assets/QuizQuest.ico'),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Go on your very own Quiz Quest!' , textAlign: TextAlign.center, textScaler: TextScaler.linear(2)),
                    ),
                    SizedBox(height: 150),
                    SizedBox(
                      height: 85,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/topics'),
                        child: const Text('Play', textScaler: TextScaler.linear(3.5)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 85,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/profile'),
                        child: const Text('Settings', textScaler: TextScaler.linear(3.5)),
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
