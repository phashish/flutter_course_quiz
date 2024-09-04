import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_course_quiz/quiz_data.dart';

class QuestionScreen extends StatefulWidget {
  final int questionId;

  const QuestionScreen({super.key, required this.questionId});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late int questionId;
  late Question question;
  int _selectedIndex = 99999999;
  bool _buttonDisabled = true;
  String _buttonText = 'Next Question';
  late List<AnsweredQuestion> answeredQuestions;

  @override
  void initState() {
    super.initState();
    questionId = widget.questionId;
    question = questions[questionId]!;
    answeredQuestions = [];
  }

  void nextQuestion() {
    // print('before questionId: $questionId');
    if (questionId == questions.length) {
      setState(() {
        answeredQuestions.add(AnsweredQuestion(
          question: question.question,
          choosenAnswer: question.options[_selectedIndex],
          correctAnswer: question.answer,
        ));
        _buttonDisabled = true;
      });
      context.go('/results', extra: answeredQuestions);
    } else {
      setState(() {
        answeredQuestions.add(AnsweredQuestion(
          question: question.question,
          choosenAnswer: question.options[_selectedIndex],
          correctAnswer: question.answer,
        ));

        questionId++;
        question = questions[questionId]!;
        _selectedIndex = 99999999;
        _buttonDisabled = true;
        if (questionId == questions.length) {
          _buttonText = 'Show Results';
        }
      });
      context.go('/quiz/$questionId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        body: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(image: AssetImage('assets/images/quiz-nbg.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    'Question\n${question.question}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          _buttonDisabled = false;
                        });
                      },
                      selected: index == _selectedIndex,
                      selectedTileColor: Colors.deepPurple.shade900,
                      selectedColor: Colors.amber,
                      contentPadding:
                          const EdgeInsets.only(left: 50.0, right: 50.0),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.deepPurple.shade900,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        question.options[index],
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade800,
                      foregroundColor: Colors.white),
                  onPressed: _buttonDisabled ? null : nextQuestion,
                  child: Text(
                    _buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
