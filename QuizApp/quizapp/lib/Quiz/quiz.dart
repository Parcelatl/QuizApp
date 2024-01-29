// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../Quiz/models/options_state.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key, required this.Score, required this.QuizTitle, required this.StartOver});
  final int Score;
  final String QuizTitle;
  final VoidCallback StartOver;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You completed the $QuizTitle quiz\nyour score is: $Score',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: StartOver,
              child: const Text('Start over'),
            )
          ],
        ),
      ),
    );
  }
}

class DisplayQuestions extends StatelessWidget {
  const DisplayQuestions(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion});
  final String question;
  final int indexAction;
  final int totalQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestion : $question',
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextquestion});
  final VoidCallback nextquestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: nextquestion,
        child: const Text(
          'Next question ',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OptionDisplay extends StatelessWidget {
  const OptionDisplay({
    super.key,
    required this.option,
    required this.color,
  });
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? unselected,
      child: ListTile(
        title: Text(
          textAlign: TextAlign.center,
          option,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
