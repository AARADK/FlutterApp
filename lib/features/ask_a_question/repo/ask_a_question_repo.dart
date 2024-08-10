import 'package:flutter_application_1/features/ask_a_question/model/ask_a_question_model.dart';

class QuestionRepository {
  Future<List<QuestionModel>> fetchQuestions() async {
    // Simulate a network or database call
    await Future.delayed(Duration(seconds: 1));

    return [
      QuestionModel(
        category: 'Love & Marriage',
        questions: [
          'Will I find my soulmate?',
          'When will I get married?',
          'Is my partner faithful?'
        ],
      ),
      QuestionModel(
        category: 'Karma & Destiny',
        questions: [
          'What is my destiny?',
          'What are my past life experiences?',
          'How can I improve my karma?'
        ],
      ),
      QuestionModel(
        category: 'Wealth & Fortune',
        questions: [
          'Will I become wealthy?',
          'What is my financial future?',
          'How can I increase my fortune?'
        ],
      ),
      QuestionModel(
        category: 'Work & Education',
        questions: [
          'Will I get a promotion?',
          'What career is best for me?',
          'Will I succeed in my studies?'
        ],
      ),
    ];
  }
}