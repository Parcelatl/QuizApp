// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class HistoryExam extends StatefulWidget {
  const HistoryExam({super.key});

  @override
  State<HistoryExam> createState() => _HistoryExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;

class _HistoryExamState extends State<HistoryExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(
          id: '1',
          title: 'Select the date of the beginning of World War I.',
          option: {'1914': true, '1925': false, '1902': false, '1852': false}),
      Question(
          id: '2',
          title:
              'Which country was not part of the Triple Entente in World War 1?',
          option: {
            'France': false,
            'Great Britain': false,
            'Italy': true,
            'Russia': false
          }),
      Question(
          id: '3',
          title: 'Whose navy was the largest at the outbreak of World War I?',
          option: {
            'German': false,
            'British': true,
            'Russian': false,
            'French': false
          }),
      Question(
          id: '4',
          title:
              'The city of Makkah holds immense religious significance for Muslims. Why?',
          option: {
            'It\'s the birthplace of coffee': false,
            'It\'s the capital of Saudi Arabia': false,
            'It\'s the holiest site in Islam': true,
            'It\'s known for its ancient pyramids': false
          }),
      Question(
          id: '5',
          title:
              'In ancient times, the Nabataeans carved impressive structures into rock faces. Where can you find their masterpieces in Saudi Arabia?',
          option: {
            'On the beaches': false,
            'In bustling cities': false,
            'In hidden desert canyons': true,
            'Underneath the sand': false
          }),
      Question(
          id: '6',
          title:
              'In the 20th century, the discovery of oil transformed Saudi Arabia. How did this resource impact the country?',
          option: {
            'It plunged the nation into poverty': false,
            'It remained untouched due to environmental concerns': false,
            'It fueled rapid modernization and economic development': true,
            'It led to widespread conflict and instability': false
          }),
      Question(
          id: '7',
          title:
              'Besides natural landmarks and historical sites, what modern achievements showcase Saudi Arabia\'s progress?',
          option: {
            'Building advanced robots and spaceships': false,
            'Investing in renewable energy and sustainable development': false,
            'Creating the world\'s tallest building': false,
            'Hosting major international events and cultural exchanges': true
          }),
      Question(
          id: '8',
          title:
              'When did the Kingdom of Saudi Arabia formally come into existence?',
          option: {'1744': false, '1804': false, '1925': false, '1932': true}),
      Question(
          id: '9',
          title: 'During which decade did the Iran-Iraq War occur?',
          option: {'1970s': false, '1980s': true, '1990s': false}),
      Question(
          id: '10',
          title: 'The Soviet Union officially dissolved in...',
          option: {'1987': false, '1992': false, '1917': false, '1991': true}),
    ];
    // ignore: non_constant_identifier_names
    List<Icon> Strike = [];
    // ignore: non_constant_identifier_names
    void StartOver() {
      setState(() {
        index = 0;
        score = 0;
        isPresed = false;
        isSelected = false;
        Strike.clear();
      });
      Navigator.pop(context);
    }

    //loop through _question ==index
    void nextQuestion() {
      if (index == question.length - 1) {
        showDialog(
            context: context,
            builder: ((context) => CompletePage(
                  Score: score,
                  QuizTitle: 'Math',
                  StartOver: StartOver,
                )));
      } else if (isPresed == true) {
        if (index == question.length - 1) {
          return;
        } else {
          setState(() {
            index++;
            isPresed = false;
            isSelected = false;
          });
        }
      }
    }

    void checkAnswer(bool value) {
      if (isSelected == true) {
        return;
      } else {
        if (value == true) {
          score += 100;
          setState(() {
            isPresed = true;
            isSelected = true;
            Strike.add(Icon(
              Icons.thumb_up,
              color: Color(0xFF32AB58),
            ));
          });
        } else {
          setState(() {
            isPresed = true;
            isSelected = true;
            Strike.add(
                Icon(Icons.thumb_down, color: Color.fromARGB(255, 172, 1, 1)));
          });
        }
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: Strike,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: DisplayQuestions(
                question: question[index].title,
                indexAction: index,
                totalQuestion: question.length),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 50),
          for (int i = 0; i < question[index].option.length; i++)
            GestureDetector(
              onTap: () => checkAnswer(
                  question[index].option.values.toList()[i] == true),
              child: OptionDisplay(
                option: question[index].option.keys.toList()[i],
                color: isPresed
                    ? question[index].option.values.toList()[i] == true
                        ? correct
                        : incorrect
                    : unselected,
              ),
            ),
        ],
      ),
      floatingActionButton: NextButton(
        nextquestion: nextQuestion,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
