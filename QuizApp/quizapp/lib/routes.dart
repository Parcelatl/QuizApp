import 'Home/home.dart';
//import 'Quiz/quiz.dart';
import 'Subjects/english.dart';
import 'Subjects/history.dart';
import 'Subjects/math.dart';
import 'Subjects/science.dart';
import 'Subjects/space.dart';
import 'Subjects/technology.dart';
import 'Topics/topics.dart';
import 'Login/login.dart';
import 'Profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  //'/quiz': (context) => const QuizScreen(),

  '/math': (context) => const MathExam(),
  '/english': (context) => const EnglishExam(),
  '/science': (context) => const ScienceExam(),
  '/tech': (context) => const TechnologyExam(),
  '/history': (context) => const HistoryExam(),
  '/space': (context) => const SpaceExam(),
};
