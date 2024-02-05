// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quizapp/Quiz/models/options_state.dart';
import 'package:quizapp/Quiz/models/question_models.dart';
import 'package:quizapp/Quiz/quiz.dart';

class EnglishExam extends StatefulWidget {
  const EnglishExam({super.key});

  @override
  State<EnglishExam> createState() => _EnglishExamState();
}

int index = 0;
bool isPresed = false;
int score = 0;
bool isSelected = false;
bool englishQuizFinished = false;
bool englishPro = false;

class _EnglishExamState extends State<EnglishExam> {
  @override
  Widget build(BuildContext context) {
    List<Question> question = [
      Question(
          id: '1',
          title: 'I suggest _________ lunch at the seaside restaurant.',
          option: {
            'Having': true,
            'To have': false,
            'We will have': false,
            'We had': false
          }),
      Question(
          id: '2',
          title:
              'His father used to tell him to work ______ in order to be successful in life.',
          option: {
            'Hardly': false,
            'Much time': false,
            'Strictly': false,
            'Hard': true
          }),
      Question(
          id: '3',
          title: 'I will call him as soon as I ______ my work.',
          option: {
            'Finish': true,
            'Will finish': false,
            'Have been finished': false,
            'Finished': false
          }),
      Question(
          id: '4',
          title: 'I will visit them soon unless something urgent _____.',
          option: {
            'Doesn’t happen': false,
            'Won’t happen': false,
            'Will happen': false,
            'Happens': true
          }),
      Question(
          id: '5',
          title: 'If the plane _________ yesterday, we would be in London now.',
          option: {
            'Wasn’t delayed': false,
            'Hadn’t been delayed': true,
            'Weren’t have a delay': false,
            'Didn’t delay': false
          }),
      Question(
          id: '6',
          title: 'Be ______________ enough to learn from your mistakes.',
          option: {
            'Spurious': false,
            'Wary': false,
            'Humble': true,
            'Eloquent': false
          }),
      Question(
          id: '7',
          title: 'I ____________ already visited Paris twice.',
          option: {'Have': true, 'Had': false, 'Was': false, 'Are': false}),
      Question(
          id: '8',
          title:
              'Dina _______ an instructor at this university since 2001. She\'s going to retire next year.',
          option: {
            'Were': false,
            'Was': false,
            'Has been': true,
            'She': false
          }),
      Question(
          id: '9',
          title: 'The house was locked, so __________ could get in.',
          option: {
            'Everybody': false,
            'Anybody': false,
            'Somebody': false,
            'Nobody': true
          }),
      Question(
          id: '10',
          title: 'Some people have difficulty in making __________ understood.',
          option: {
            'Themselves': true,
            'Them': false,
            'One': false,
            'Oneself': false
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
        englishQuizFinished = true;
        Strike.clear();
      });
      Navigator.pop(context);
    }

    void backToStart() {
      StartOver();
      englishQuizFinished = true;
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
          englishPro = true;
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
