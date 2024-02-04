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
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: 100,
          //           width: 100,
          //           clipBehavior: Clip.antiAlias,
          //           decoration: BoxDecoration(
          //               color: Colors.grey[800],
          //              shape: BoxShape.circle),
          //           child: const Icon(FontAwesomeIcons.solidIdBadge, size: 75),
          //         ),
          //         const SizedBox(width: 15),
          //         const SizedBox(
          //           height: 100,
          //           width: 250,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'First Name',
          //                 textScaler: TextScaler.linear(1.5),
          //               ),
          //               Divider(thickness: 2),
          //               Text(
          //                 'Second Name',
          //                 textScaler: TextScaler.linear(1.5),
          //               ),
          //               Divider(thickness: 2),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          const Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Achievements',
              textScaler: TextScaler.linear(2.5),
            ),
          ),
          Container(height: 1, color: Colors.grey[800]),
          ColoredBox(
            color: Color.fromARGB(255, 50, 50, 50),
            child: SizedBox(
              height: 493,
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 75,
                  width: 300,
                  child: ElevatedButton(
                    child: const Text(
                      'Delete Account',
                      textScaler: TextScaler.linear(2),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 75,
                  width: 200,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Out',
                      textScaler: TextScaler.linear(2),
                    ),
                    onPressed: () async {
                      await AuthService().signOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding achievementTile(Icon achIcon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            tileColor: Colors.grey[900],
            leading: achIcon,
            title: Text(title , textScaler: const TextScaler.linear(1.4)),
            subtitle: Text(subtitle , textScaler: const TextScaler.linear(1.4)),
          ),
        ),
      ),
    );
  }
}
