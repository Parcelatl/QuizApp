// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../Quiz/models/options_state.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key, required this.Score, required this.QuizTitle, required this.StartOver, required this.backToStart});
  final int Score;
  final String QuizTitle;
  final VoidCallback StartOver;
  final VoidCallback backToStart;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Congratulations!' , textAlign: TextAlign.center),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You completed the $QuizTitle quiz\nyour score is: $Score',
              textAlign: TextAlign.center, textScaler: const TextScaler.linear(1.25),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: StartOver,
                child: const Text('Start over' , textScaler: TextScaler.linear(1.75),),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: backToStart,
                child: const Text("Quit" , textScaler: TextScaler.linear(1.75),),
              ),
            ),
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
      child: SizedBox(
        height: 60,
        width: 250,
        child: ElevatedButton(
          onPressed: nextquestion,
          child: const Text(
            'Next question ',
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(2)
          ),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      color: color,
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
