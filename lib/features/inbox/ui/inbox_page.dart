// lib/ui/inbox_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auspicious_time/ui/auspicious_time_page.dart';
import 'package:flutter_application_1/features/compatibility/ui/compatibility_page.dart';
import 'package:flutter_application_1/features/horoscope/ui/horoscope_page.dart';
import 'package:flutter_application_1/features/inbox/model/inbox_model.dart';
import 'package:flutter_application_1/features/inbox/service/inbox_service.dart';
import 'package:flutter_application_1/features/inbox/ui/chat_box_page.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final MessageService _messageService = MessageService();
  late List<Message> _messages;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _messages = _messageService.fetchMessages();
  }

  void _openChatBox(Message message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatBoxPage(message: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Message> filteredMessages = _messages.where((message) {
      return message.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             message.content.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Navigate back to previous screen
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          color: Color(0xFFFF9933),
                        ),
                      ),
                    ),
                    Text(
                      'Inbox',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Inter',
                        color: Color(0xFFFF9933),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.12,
                      height: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4DFC8),
                        borderRadius: BorderRadius.circular(screenWidth * 0.06),
                      ),
                      child: Icon(
                        Icons.inbox,
                        color: Color(0xFFFF9933),
                        size: screenWidth * 0.08,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Color(0xFFC06500)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredMessages.length,
              itemBuilder: (context, index) {
                final message = filteredMessages[index];
                return ListTile(
                  leading: Container(
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                    decoration: BoxDecoration(
                      color: message.categoryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  title: Text(
                    message.title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  subtitle: Text(
                    message.content,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  onTap: () => _openChatBox(message),
                );
              },
            ),
            SizedBox(height: screenWidth * 0.05),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFFF9933))), // Top border color
        ),
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02, horizontal: screenWidth * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                  MaterialPageRoute(builder: (context) => AuspiciousTimePage()),
                );
              },
              child: Image.asset(
                'assets/images/auspicious2.png',
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}