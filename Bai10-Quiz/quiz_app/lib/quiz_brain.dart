import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;
  
  final List<Question> _questionBank = [
    Question('The Earth is flat.', false),
    Question('Flutter is developed by Google.', true),
    Question('Cows can fly.', false),
    Question('The Moon is a planet.', false),
    Question('Dolphins are mammals.', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  bool isFinished() {
    return _questionIndex >= _questionBank.length - 1;
  }

  void reset() {
    _questionIndex = 0;
  }
}
