// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class TechnologyExam extends StatefulWidget {
  const TechnologyExam({super.key});

  @override
  State<TechnologyExam> createState() => _TechnologyExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;

class _TechnologyExamState extends State<TechnologyExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(
          id: '1',
          title: 'Which computer language is the most widely used?(easy)',
          option: {'C#': false, 'Swift': false, 'PHP': false, 'Java': true}),
      Question(
          id: '2',
          title:
              'What technology is used to make telephone calls over the internet possible?(easy)',
          option: {
            'Bluetooth': false,
            'Ethernet': false,
            'NFC': false,
            'VoIP': true
          }),
      Question(
          id: '3',
          title:
              'Making a compressed digital archive might produce what type of file format(easy)',
          option: {'PDF': false, 'JPEG': false, 'ZIP': true, 'MP3': false}),
      Question(
          id: '4',
          title:
              'What feature is often used to identify whether a visitor to a website is human or not?(easy)',
          option: {
            'CAPTCHA': true,
            'General problem Solver': false,
            'CYC': false,
            'DENDRAL': false
          }),
      Question(
          id: '5',
          title: 'What does the acronym VPN stand for?(medium)',
          option: {
            'visual protocol networking': false,
            'visual processing network': false,
            'virtual private network': true,
            'visual protocol network': false
          }),
      Question(
          id: '6',
          title: 'One byte is equivalent to how many bits?(easy)',
          option: {'8': true, '32': false, '12': false, '64': false}),
      Question(
          id: '7',
          title: 'Which of these is not an example of malware(easy)',
          option: {
            'Torjan': false,
            'spyware': false,
            'plug-in': true,
            'computer worm': false
          }),
      Question(
          id: '8',
          title:
              'A number that uniquely identifies each computer on the Internet is called(easy)',
          option: {
            'MAC address': false,
            'IP address': true,
            'Gopher': false,
            'DNS': false
          }),
      Question(
          id: '9',
          title: 'What is the name for a computer pointing device?(easy)',
          option: {
            'a modem': false,
            'a sound card': false,
            'a monitor': false,
            'a mouse': true
          }),
      Question(
          id: '10',
          title: 'Which of these is not a peripheral, in computer terms?(easy)',
          option: {
            'keyboard': false,
            'monitor': false,
            'motherboard': true,
            'mouse': false
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

        void backToStart() {
      StartOver();
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
