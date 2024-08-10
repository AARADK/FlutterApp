import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/ask_a_question/ui/ask_a_question_page.dart';
import 'package:flutter_application_1/features/auspicious_time/ui/auspicious_time_page.dart';
import 'package:flutter_application_1/features/compatibility/ui/compatibility_page.dart';
import 'package:flutter_application_1/features/horoscope/ui/horoscope_page.dart';
import 'package:flutter_application_1/features/inbox/ui/inbox_page.dart';
import 'package:flutter_application_1/features/menu/ui/menu_page.dart';

class OfferItem extends StatelessWidget {
  final String imageUrl;

  const OfferItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<String> offerImages = [
    'assets/images/christmas.jpg',
    'assets/images/newyear.jpg',
    'assets/images/marriage.jpg',
    'assets/images/11142.jpg',
    'assets/images/planets.jpg',
  ];
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (mounted) {
        setState(() {
          if (_currentPage < offerImages.length - 1) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  void _openMenu() {
    setState(() {
      _isMenuOpen = true;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final double iconSize = size.width * 0.12;
    final double circleSize = size.width * 0.22;
    final double buttonWidth = size.width * 0.8;
    final double buttonHeight = size.height * 0.07;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_isMenuOpen) {
                _closeMenu();
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx < -6 && _isMenuOpen) {
                _closeMenu(); // Close the menu on left swipe if it's open
              } else if (details.delta.dx > 6 && !_isMenuOpen) {
                _openMenu(); // Open the menu on right swipe if it's closed
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _openMenu(); // Open the menu when the menu icon is tapped
                                  },
                                  child: Container(
                                    width: iconSize,
                                    height: iconSize,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFFFF9933)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(Icons.menu, color: Color(0xFFFF9933)),
                                  ),
                                ),
                                Text(
                                  'My FutureTime',
                                  style: TextStyle(
                                    fontSize: size.width * 0.06,
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
                                    width: iconSize,
                                    height: iconSize,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFFFF9933)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(Icons.inbox, color: Color(0xFFFF9933)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: size.height * 0.2,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: offerImages.length,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            itemBuilder: (context, index) {
                              return OfferItem(imageUrl: offerImages[index]);
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            offerImages.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == index ? 12 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index ? Color(0xFFFF9933) : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildCircleSection(
                                context,
                                title: 'Horoscope',
                                imageUrl: 'assets/images/horoscope2.png',
                                imageWidth: circleSize * 0.67,
                                imageHeight: circleSize * 0.75,
                                page: HoroscopePage(),
                              ),
                              SizedBox(height: 12),
                              _buildCircleSection(
                                context,
                                title: 'Compatibility',
                                imageUrl: 'assets/images/compatibility2.png',
                                imageWidth: circleSize * 0.67,
                                imageHeight: circleSize * 0.55,
                                page: CompatibilityPage(),
                              ),
                              SizedBox(height: 12),
                              _buildCircleSection(
                                context,
                                title: 'Auspicious Time',
                                imageUrl: 'assets/images/auspicious2.png',
                                imageWidth: circleSize * 0.67,
                                imageHeight: circleSize * 0.75,
                                page: AuspiciousTimePage(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AskQuestion()),
                        );
                      },
                      child: Text(
                        'Ask a Question',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFFF9933),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        fixedSize: Size(buttonWidth, buttonHeight),
                        shadowColor: Colors.black,
                        elevation: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: _isMenuOpen ? 0 : -size.width * 0.8,
            top: 0,
            bottom: 0,
            child: Menu(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFFF9933))),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
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
                width: iconSize,
                height: iconSize,
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
                width: iconSize,
                height: iconSize,
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
                width: iconSize,
                height: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
Widget _buildCircleSection(
      BuildContext context,
      {required String title,
      required String imageUrl,
      required double imageWidth,
      required double imageHeight,
      required Widget page}) {
    final size = MediaQuery.of(context).size;
    final double circleSize = size.width * 0.18;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFFF9933),
                width: 3,
              ),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontFamily: 'Inter',
              color: Color(0xFFC06500),
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}