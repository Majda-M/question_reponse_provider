import 'package:flutter/material.dart';
import 'package:question_reponse_provider/pages/quiz.provider.page.dart';

class QuizState extends ChangeNotifier {

  bool responseStatus=true;
  int questionIndex=0;

  void checkAnswer(bool response,Question question,int length){
    if (response == question.isCorrect) {
      responseStatus = true;
      nextQuestion(length);
      notifyListeners();
    } else {
      responseStatus = false;
      notifyListeners();
    }

  }
  void nextQuestion(int length){
    if (questionIndex < length - 1) {
      ++questionIndex;
      notifyListeners();
    } else {
      questionIndex = 0;
      notifyListeners();
    }

  }

}
