class Question {
  String question;
  String answer;
  List<String> options = [];
  Question({
    required this.question,
    required this.answer,
    required this.options,
  });
}

Map questions = {
  1: Question(
    question: 'What is your favorite color?',
    answer: 'Red',
    options: ['Red', 'Blue', 'Green', 'Yellow'],
  ),
  2: Question(
    question: 'What is your favorite food?',
    answer: 'Pizza',
    options: ['Pizza', 'Burger', 'Pasta', 'Salad'],
  ),
  3: Question(
    question: 'What is your favorite animal?',
    answer: 'Cat',
    options: ['Cat', 'Dog', 'Cow', 'Elephant'],
  ),
  4: Question(
    question: 'What is your favorite movie?',
    answer: 'The Godfather',
    options: ['The Godfather', 'The Matrix', 'Placebo', 'Inside Out'],
  ),
};

class AnsweredQuestion {
  String question;
  String choosenAnswer;
  String correctAnswer;

  AnsweredQuestion({
    required this.question,
    required this.choosenAnswer,
    required this.correctAnswer,
  });

  AnsweredQuestion.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        choosenAnswer = json['choosenAnswer'],
        correctAnswer = json['correctAnswer'];

  Map<String, dynamic> toJson() => {
        'question': question,
        'choosenAnswer': choosenAnswer,
        'correctAnswer': correctAnswer,
      };
}
