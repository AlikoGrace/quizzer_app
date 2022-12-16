import 'question.dart';

//Every logic of the app should be here.
class QuizBrain {
  int _questionNumber = 0;
//  a quizbrain should have questions
  final List<Question> _questionBank = [
    Question('The human body has 89 tissues', false),
    Question('Accra is the capital city of Ghana', true),
    Question('Ghana has 10 regions', false),
    Question('Nana Addo is the president of Ghana', true),
    Question('Ghana scored portugal in the world cup', false),
    Question('little salt kills flesh', false),
    Question('Money is the root of all evil', false),
    Question('mice is the plural for mouse', true),
    Question('Ghana has 10 regions', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      //the - 1 is because question number starts from 0 while length is 145
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //look for the meaning of dead code
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
