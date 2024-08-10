// lib/features/auspicious_time/ui/auspicious_time_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/ask_a_question/ui/ask_a_question_page.dart';
import 'package:flutter_application_1/features/auspicious_time/model/auspicious_time_model.dart';
import 'package:flutter_application_1/features/auspicious_time/repo/auspicious_time_repo.dart';
import 'package:flutter_application_1/features/auspicious_time/service/auspicious_time_service.dart';
import 'package:flutter_application_1/features/compatibility/ui/compatibility_page.dart';
import 'package:flutter_application_1/features/horoscope/ui/horoscope_page.dart';
import 'package:flutter_application_1/features/inbox/ui/inbox_page.dart';
import 'package:flutter_application_1/features/payment/ui/payment_page.dart';

class AuspiciousTimePage extends StatelessWidget {
  final AuspiciousTimeService service = AuspiciousTimeService(AuspiciousTimeRepository());

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<AuspiciousTime>(
      future: service.getAuspiciousTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        final auspiciousTime = snapshot.data!;

        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.2), // Provide space for buttons
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context); // Navigate back to previous screen
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
                                auspiciousTime.title,
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
                                  child: Icon(Icons.inbox, color: Color(0xFFFF9933), size: screenWidth * 0.06,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Center(
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFFF9933),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              auspiciousTime.imageUrl,
                              width: screenWidth * 0.2,
                              height: screenWidth * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                        child: Text(
                          auspiciousTime.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenWidth * 0.040,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AskQuestion()),
                          );
                        },
                        child: Text(
                          'Ask a Question',
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
                      SizedBox(height: screenHeight * 0.01),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentPage()),
                          );
                        },
                        child: Text(
                          'Get Full Reading',
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFFFF9933))),
            ),
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025, horizontal: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompatibilityPage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/compatibility2.png',
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HoroscopePage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/horoscope2.png',
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuspiciousTimePage()),
                    );
                  },
                  child: Image.asset(
                    'assets/images/auspicious2.png',
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    color: Color(0xFFFF9933),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}