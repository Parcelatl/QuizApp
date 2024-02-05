// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class SpaceExam extends StatefulWidget {
  const SpaceExam({super.key});

  @override
  State<SpaceExam> createState() => _SpaceExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;
bool spaceQuizFinished = false;
bool spacePro = false;

class _SpaceExamState extends State<SpaceExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(id: '1', title: 'Our closest star is called...(easy)', option: {
        'Sirius': false,
        'The Sun': true,
        'Proxima Centauri': false,
        'Venus': false
      }),
      Question(
          id: '2',
          title: 'Earth has one moon, while Pluto has...(easy)',
          option: {
            'none': false,
            'one': false,
            'five': true,
            'hundreds': false
          }),
      Question(
          id: '3',
          title:
              'If you could jump on the Moon, how much farther could you reach, compared to jumping on Earth?(medium)',
          option: {
            'slightly higher': false,
            'twice as high': false,
            'four times as high': false,
            'six times as high': true
          }),
      Question(
          id: '4',
          title:
              'Planets spin on their axes. What causes the day and night cycle on Earth?(medium)',
          option: {
            'the Sun orbiting Earth': false,
            'Earth spinning on its axis': true,
            'clouds blocking the Sun': false,
            'shadows cast by other planets': false
          }),
      Question(
          id: '5',
          title: 'Which of the following is the hottest planet(medium)',
          option: {
            'Mercury': false,
            'Mars': false,
            'Venus': true,
            'None of the above': false
          }),
      Question(
          id: '6',
          title: 'How long does a day on Jupiter last?(hard)',
          option: {
            '43 hours': false,
            '25 hours': false,
            '10 hours': true,
            '32 hours': false
          }),
      Question(
          id: '7',
          title: 'Which type of planet is Jupiter(medium-hard)',
          option: {
            'A gas giant': true,
            'An exoplanet': false,
            'An Iron Planet': false,
            'None of the above': false
          }),
      Question(
          id: '8',
          title:
              'Astronauts wear those bulky helmets in space. What\'s the MAIN reason?(easy)',
          option: {
            'to look cool': false,
            'to keep warm': false,
            'to provide oxygen and protection from harsh conditions': true,
            'to communicate with each other': false
          }),
      Question(
          id: '9',
          title:
              'Which planet in our solar system is known as the "Red Planet"?',
          option: {
            'Jupiter': false,
            'Saturn': false,
            'Mars': true,
            'Venus': false
          }),
      Question(
          id: '10',
          title:
              'Which planet in our solar system is known as the "Red Planet"?',
          option: {
            'Jupiter': false,
            'Saturn': false,
            'Mars': true,
            'Venus': false
          }),
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
        spaceQuizFinished = true;
        Strike.clear();
      });
      Navigator.pop(context);
    }

        void backToStart() {
      StartOver();
      spaceQuizFinished = true;
      Navigator.pushNamedAndRemoveUntil(context, '/' , (route) => false); 
      Navigator.pushNamed(context, '/topics');
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
                  backToStart: backToStart,
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
          if(score >= 1000)
          spacePro = true;
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
