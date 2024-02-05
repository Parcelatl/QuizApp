import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/Subjects/english.dart';
import 'package:quizapp/Subjects/history.dart';
import 'package:quizapp/Subjects/math.dart';
import 'package:quizapp/Subjects/science.dart';
import 'package:quizapp/Subjects/space.dart';
import 'package:quizapp/Subjects/technology.dart';

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
              height: 524,
              child: ListView(
                children: [
                  achievementTile(const Icon(Icons.circle_outlined), 'Math beginner', 'Finish Math quiz.', mathQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'Math pro', 'Finish Math quiz with a score of 1000.', mathPro),
                  achievementTile(const Icon(Icons.circle_outlined), 'English beginner', 'Finish English quiz.', englishQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'English pro', 'Finish English quiz with score of 1000.', englishPro),
                  achievementTile(const Icon(Icons.circle_outlined), 'Science beginner', 'Finish Science quiz.', scienceQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'Science pro', 'Finish Science quiz with a score of 1000.', sciencePro),
                  achievementTile(const Icon(Icons.circle_outlined), 'Technology beginner', 'Finish Technology quiz.', techQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'Technology pro', 'Finish Technology quiz with a score of 1000.', techPro),
                  achievementTile(const Icon(Icons.circle_outlined), 'History beginner', 'Finish History quiz.', historyQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'History pro', 'Finish History quiz with a score of 1000.', historyPro),
                  achievementTile(const Icon(Icons.circle_outlined), 'Space beginner', 'Finish Space quiz.', spaceQuizFinished),
                  achievementTile(const Icon(Icons.circle_outlined), 'Space pro', 'Finish Space quiz with a score of 1000.', spacePro),
                  achievementTile(const Icon(Icons.circle_outlined), 'One to rule them all', 'Get a score of 1000 on all topics.', (mathPro && englishPro && sciencePro && techPro && historyPro && spacePro)),
                
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
                  height: 60,
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
                  height: 60,
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

  Padding achievementTile(Icon achIcon, String title, String subtitle, bool completed) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          tileColor: Colors.grey[900],
          leading: (completed == true) ? const Icon(Icons.check) : achIcon ,
          title: Text(title , textScaler: const TextScaler.linear(1.4)),
          subtitle: Text(subtitle , textScaler: const TextScaler.linear(1.4)),
        ),
      ),
    );
  }
}
