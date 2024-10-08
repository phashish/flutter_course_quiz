import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_course_quiz/quiz_data.dart';

class ResultsScreen extends StatelessWidget {
  final List<AnsweredQuestion> answeredQuestions;
  const ResultsScreen({super.key, required this.answeredQuestions});

  @override
  Widget build(BuildContext context) {
    int totalScore = 0;
    for (var i in answeredQuestions) {
      totalScore += i.choosenAnswer == i.correctAnswer ? 1 : 0;
    }
    String displayScore =
        "Score: ${totalScore.toString()} / ${answeredQuestions.length.toString()}";
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(image: AssetImage('assets/images/quiz-nbg.png')),
              Text(displayScore, style: const TextStyle(fontSize: 24)),
              ListView.separated(
                padding: const EdgeInsets.all(50),
                shrinkWrap: true,
                itemCount: answeredQuestions.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  String choosen = answeredQuestions[index].choosenAnswer;
                  String correct = answeredQuestions[index].correctAnswer;
                  String subText =
                      "You chose: $choosen\nCorrect answer: $correct";
                  return ListTile(
                    tileColor:
                        choosen == correct ? Colors.blue[100] : Colors.red[200],
                    contentPadding:
                        const EdgeInsets.only(left: 20.0, right: 20.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.deepPurple.shade900,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      answeredQuestions[index].question,
                      // textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      subText,
                      // textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade800,
                    foregroundColor: Colors.white),
                onPressed: () => context.go('/'),
                child: const Text(
                  'Go to start',
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}
