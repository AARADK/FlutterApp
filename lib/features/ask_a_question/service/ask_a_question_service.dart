import 'package:flutter_application_1/features/ask_a_question/model/ask_a_question_model.dart';
import 'package:flutter_application_1/features/ask_a_question/repo/ask_a_question_repo.dart';

class QuestionService {
  final QuestionRepository _repository = QuestionRepository();

  Future<List<QuestionModel>> getQuestions() {
    return _repository.fetchQuestions();
  }
}