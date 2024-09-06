// GoRouter configuration
import 'package:flutter_course_quiz/quiz_data.dart';
import 'package:flutter_course_quiz/screens/intro_screen.dart';
import 'package:flutter_course_quiz/screens/question_screen.dart';
import 'package:flutter_course_quiz/screens/results_screen.dart';
import 'package:flutter_course_quiz/screens/error_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: '/quiz/:id',
      builder: (context, state) {
        final qId = int.parse(state.pathParameters['id'] ?? '1');
        return QuestionScreen(questionId: qId);
      },
    ),
    GoRoute(
      path: '/results',
      builder: (context, state) {
        try {
          List<AnsweredQuestion> answeredQuestions =
              state.extra as List<AnsweredQuestion>;
          return ResultsScreen(answeredQuestions: answeredQuestions);
        } on Exception catch (_) {
          return const ErrorScreen();
        }
      },
    ),
  ],
);
