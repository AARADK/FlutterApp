import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/ask_a_question/service/ask_a_question_service.dart';
import 'package:flutter_application_1/features/dashboard/ui/dashboard_page.dart';
import 'package:flutter_application_1/features/inbox/ui/inbox_page.dart';
import 'package:flutter_application_1/features/payment/ui/payment_page.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestion> {
  String? selectedCategory;
  String? selectedQuestion;
  List<String> categories = [];
  List<String> questions = [];
  final QuestionService _questionService = QuestionService();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final questionModels = await _questionService.getQuestions();
    setState(() {
      categories = questionModels.map((model) => model.category).toList();
      selectedCategory = categories.first;
      questions = questionModels
          .firstWhere((model) => model.category == selectedCategory)
          .questions;
      selectedQuestion = questions.first;
    });
  }

  void _updateQuestions(String category) async {
    final questionModels = await _questionService.getQuestions();
    final model = questionModels.firstWhere((model) => model.category == category);
    setState(() {
      questions = model.questions;
      selectedQuestion = questions.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardPage()),
                        );
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          color: Color(0xFFFF9933),
                        ),
                      ),
                    ),
                    Text(
                      'Ask a Question',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: Color(0xFFFF9933),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InboxPage()),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFF9933)),
                          borderRadius: BorderRadius.circular(screenWidth * 0.06),
                        ),
                        child: Icon(Icons.inbox, color: Color(0xFFFF9933), size: screenWidth * 0.06),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFF9933)),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/questions.png',
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.18,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Select a category:',
                      style: TextStyle(
                        color: Color(0xFFFF9933),
                        fontSize: screenWidth * 0.045,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFFF9933), width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                            _updateQuestions(newValue);
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Text(
                      'Select a question:',
                      style: TextStyle(
                        color: Color(0xFFFF9933),
                        fontSize: screenWidth * 0.045,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFFF9933), width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: selectedQuestion,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: questions.map((String question) {
                          return DropdownMenuItem<String>(
                            value: question,
                            child: Text(question),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedQuestion = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
                child: Text(
                      'Submit Question',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFF9933),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      fixedSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                      shadowColor: Colors.black,
                      elevation: 10,
                    ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}