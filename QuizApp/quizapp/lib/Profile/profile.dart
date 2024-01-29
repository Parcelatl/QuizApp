import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                       shape: BoxShape.circle),
                    child: const Icon(FontAwesomeIcons.solidIdBadge, size: 75),
                  ),
                  const SizedBox(width: 15),
                  const SizedBox(
                    height: 100,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abdulellah',
                          textScaler: TextScaler.linear(1.5),
                        ),
                        Divider(thickness: 2),
                        Text(
                          'Altowaijri',
                          textScaler: TextScaler.linear(1.5),
                        ),
                        Divider(thickness: 2),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'Achievements',
                textScaler: TextScaler.linear(2),
              ),
              Container(height: 1, color: Colors.grey[800]),
            ],
          ),
          ColoredBox(
            color: Color.fromARGB(255, 50, 50, 50),
            child: SizedBox(
              height: 524,
              child: ListView(
                children: [
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                  achievementTile(const Icon(Icons.spa), 'Achievement Title',
                      'Achievement description'),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[800],
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  child: const Text(
                    'Delete Account',
                    textScaler: TextScaler.linear(1.5),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  child: const Text(
                    'Sign Out',
                    textScaler: TextScaler.linear(1.5),
                  ),
                  onPressed: () async {
                    await AuthService().signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }

  Card achievementTile(Icon achIcon, String title, String subtitle) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          tileColor: Colors.grey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: achIcon,
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
