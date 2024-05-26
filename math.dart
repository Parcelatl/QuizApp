// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class MathExam extends StatefulWidget {
  const MathExam({super.key});

  @override
  State<MathExam> createState() => _MathExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;
bool mathQuizFinished = false;
bool mathPro = false;

class _MathExamState extends State<MathExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(id: '1', title: 'What is Pi?', option: {
        '3.13159': false,
        '3.15159': false,
        '3.14159': true,
        '3.14158': false
      }),
      Question(
          id: '2',
          title:
              'Find the missing terms in the multiple of 3: 3, 3, 6, 9, __, 15',
          option: {'10': false, '13': false, '12': true, '14': false}),
      Question(
          id: '3',
          title: 'What is the next prime number after 5?',
          option: {'6': false, '7': true, '9': false, '11': false}),
      Question(id: '4', title: 'Is a triangle a:', option: {
        'Two-dimensional shape': true,
        'Three-dimensional shape': false,
        'One-dimensional shape': false,
        'None of the above': false
      }),
      Question(
          id: '5',
          title: 'What is the value of cos 360°?',
          option: {'0': false, '1': true, '-1': false, 'Undefined': false}),
      Question(
          id: '6',
          title: 'What is the result of 5! (factorial)?',
          option: {'20': false, '60': false, '120': true, '240': false}),
      Question(
          id: '7',
          title: 'What is the sum of the angles in a triangle?',
          option: {
            '90 degrees': false,
            '180 degrees': true,
            '270 degrees': false,
            '360 degrees': false
          }),
      Question(
          id: '8',
          title: 'Which of the following is an irrational number?',
          option: {'0.5': false, '1': false, '√2': true, '3/4': false}),
      Question(
          id: '9',
          title: 'What is the value of sin(90°)?',
          option: {'0': false, '1': true, '-1': false, 'Undefined': false}),
      Question(
          id: '10',
          title:
              'A store offers a 20% discount on a 50 SAR item. What is the final price?',
          option: {'10': false, '20': false, '30': true, '40': false}),
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
        mathQuizFinished = true;
        Strike.clear();
      });
      Navigator.pop(context);
    }

        void backToStart() {
      StartOver();
      mathQuizFinished = true;
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
          mathPro = true;
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
