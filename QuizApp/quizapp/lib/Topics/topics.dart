import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        padding: const EdgeInsets.all(15),
        children: [
          //Modify the path once the topic screens are done.
          cardTopic('Math', '/math', 'assets/covers/math.png', context),
          cardTopic('English', '/english', 'assets/covers/english.png', context),
          cardTopic('Science', '/science', 'assets/covers/science.png', context),
          cardTopic('Technology', '/tech', 'assets/covers/tech.png', context),
          cardTopic('History', '/history', 'assets/covers/history.png', context),
          cardTopic('Space', '/space', 'assets/covers/space.png', context),
        ],
      ),
    );
  }

  Card cardTopic(String name, var navName, String image, BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Image.asset(image,
                  fit: BoxFit.cover)),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                        'Subject: $name',
                        textScaler: const TextScaler.linear(2),
                      ))),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, navName),
                          child: const Text(
                            'Start',
                            textScaler: TextScaler.linear(2),
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
