import 'Home/home.dart';
import 'Quiz/quiz.dart';
import 'Topics/topics.dart';
import 'Login/login.dart';
import 'Profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/quiz': (context) => const QuizScreen(),
};
