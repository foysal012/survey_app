import 'package:flutter/cupertino.dart';
import 'package:survey_app/repository/question_repository.dart';
import '../model/question_response.dart';

class QuestionController with ChangeNotifier {
  bool _isScreenLoading = false;
  bool get isScreenLoading => _isScreenLoading;

  String _groupValue = '';
  String get groupValue => _groupValue;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Record> questionData = [];

  void setGroupValue(String value) {
    _groupValue = value;
    notifyListeners();
  }

  void goToNextQuestion() {
    final selectedOption = questionData[_currentIndex].options?.firstWhere(
          (opt) => opt.value == _groupValue,
    );

    if (selectedOption != null) {
      final nextId = selectedOption.referTo?.id;
      if (nextId != null && nextId != 'submit') {
        jumpToQuestionById(nextId);
      }
    }
  }

  void skipQuestion() {
    final skipId = questionData[_currentIndex].skip?.id;
    if (skipId != null && skipId != '-1') {
      jumpToQuestionById(skipId);
    }
  }

  void jumpToQuestionById(String id) {
    final nextIndex = questionData.indexWhere((item) => item.id == id);
    if (nextIndex != -1) {
      _currentIndex = nextIndex;
      _groupValue = '';
      notifyListeners();
    }
  }

  Future<void> initialMethod() async {
    _isScreenLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    await getQuestion();
    _isScreenLoading = false;
    notifyListeners();
  }

  Future<void> getQuestion() async {
    try {
      var response = await QuestionRepository.getQuestion();
      questionData = response.record ?? [];
    } catch (e) {
      debugPrint('Exception ${e.toString()}');
    }
  }
}
