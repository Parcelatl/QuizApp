// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class ScienceExam extends StatefulWidget {
  const ScienceExam({super.key});

  @override
  State<ScienceExam> createState() => _ScienceExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;

class _ScienceExamState extends State<ScienceExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(id: '1', title: 'What\'s faster, sound or light?', option: {
        'Sound': false,
        'Light': true,
        'They travel at the same speed': false,
        'They don\'t move': false
      }),
      Question(
          id: '2',
          title: 'What is the atomic number for Hydrogen?',
          option: {'1': true, '12': false, '36': false, '24': false}),
      Question(
          id: '3',
          title:
              'Epiphytic and parasitic plants grow on which of the following?',
          option: {
            'plants': true,
            'humans': false,
            'rocks': false,
            'dogs': false
          }),
      Question(
          id: '4',
          title: 'The human skeleton is made up of ______________ bones.',
          option: {
            'less than 100 bones': false,
            'more than 100 bones': true,
            'less than 80 bones': false,
            'close to 80 bones': false
          }),
      Question(id: '5', title: 'Electrons are:', option: {
        'Larger than molecules': false,
        'Smaller than molecules': true,
        'Approximately the same size as molecules': false,
        'Size is not comparable to molecules': false
      }),
      Question(id: '6', title: 'Sharks are:', option: {
        'Mammals': false,
        'Reptiles': false,
        'Fish': true,
        'Birds': false
      }),
      Question(id: '7', title: 'Kelvin is a measure of:', option: {
        'Length': false,
        'Mass': false,
        'Temperature': true,
        'Time': false
      }),
      Question(
          id: '8',
          title:
              'The chemical makeup of food often _____________ when you cook it.',
          option: {
            'Evaporates': false,
            'Expands': false,
            'Dissolves': false,
            'Changes': true
          }),
      Question(
          id: '9',
          title: 'Atoms are most stable when their outer shells are:',
          option: {
            'Full': true,
            'Empty': false,
            'Partially filled': false,
            'Unpredictable': false
          }),
      Question(id: '10', title: 'Conductors have:', option: {
        'Low resistance': true,
        'High resistance': false,
        'No resistance': false,
        'Variable resistance': false
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
