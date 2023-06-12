import 'questionModel.dart';

class QuestionsBank {
  int index = 0;
  int score = 0;
  bool isCorrect = true;
  bool inRange = true;
  List<Question> questions = [
    Question(text: 'The color of cherries is red?', ans: true),
    Question(text: 'Butterflies are not birds?', ans: true),
    Question(text: 'The capital of France is Washington DC?', ans: false),
    Question(text: 'There are four lungs found in the human body?', ans: false),
    Question(
        text: 'Jupiter is the smallest planet in the solar system?',
        ans: false),
  ];

  Question showQuestion() {
    return questions[index];
  }

  void moveQuestion() {
    if (index >= questions.length - 1) {
      inRange = false;
    } else
      index++;
  }

  void checkAnswer(ans) {
    if (index <= questions.length - 1) {
      if (showQuestion().ans == ans) {
        score += 1;
        isCorrect = true;
      } else
        isCorrect = false;
    }
  }

  int getScore() {
    return score;
  }
}
