import 'package:flutter/material.dart';

import '../Services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign Out'),
          onPressed:() async {
            await AuthService().signOut();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
      ),
    );
  }
}