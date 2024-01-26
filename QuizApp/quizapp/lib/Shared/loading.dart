import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/QuizQuest.ico',
              scale: 1.5,
            ),
            const SizedBox(
              height: 12.5,
            ),
            const Text('QuizQuest', textScaler: TextScaler.linear(2)),
            const SizedBox(
              height: 75,
            ),
            const CircularProgressIndicator(
              strokeWidth: 4,
              strokeCap: StrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Loader();
  }
}
