import 'package:flutter/material.dart';

class OtpOverlay extends StatefulWidget {
  @override
  _OtpOverlayState createState() => _OtpOverlayState();
}

class _OtpOverlayState extends State<OtpOverlay> {
  TextEditingController _otpController1 = TextEditingController();
  TextEditingController _otpController2 = TextEditingController();
  TextEditingController _otpController3 = TextEditingController();
  TextEditingController _otpController4 = TextEditingController();
  TextEditingController _otpController5 = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();
  FocusNode _focusNode5 = FocusNode();

  bool _showError = false; // Track whether to show error message

  @override
  void dispose() {
    _otpController1.dispose();
    _otpController2.dispose();
    _otpController3.dispose();
    _otpController4.dispose();
    _otpController5.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    super.dispose();
  }

  void _nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Center(
            child: Container(
              width: 313,
              height: 357,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 174,
                    child: SizedBox(
                      width: 253,
                      height: 42,
                      child: Text(
                        'A 6 digit OTP has been sent to \n \n  \n \n your email!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFC06500),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 67,
                    top: 6,
                    child: Container(
                      width: 180,
                      height: 153,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/otp.png"), // Replace with your image asset path
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    top: 288,
                    child: Container(
                      width: 24.01,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: _otpController1,
                        focusNode: _focusNode1,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300, // Light weight
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _nextField(value: value, focusNode: _focusNode1);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 115,
                    top: 288,
                    child: Container(
                      width: 24.01,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: _otpController2,
                        focusNode: _focusNode2,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300, // Light weight
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _nextField(value: value, focusNode: _focusNode2);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145,
                    top: 288,
                    child: Container(
                      width: 24.01,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: _otpController3,
                        focusNode: _focusNode3,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300, // Light weight
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _nextField(value: value, focusNode: _focusNode3);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 175,
                    top: 288,
                    child: Container(
                      width: 24.01,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: _otpController4,
                        focusNode: _focusNode4,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300, // Light weight
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _nextField(value: value, focusNode: _focusNode4);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 205,
                    top: 288,
                    child: Container(
                      width: 24.01,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: _otpController5,
                        focusNode: _focusNode5,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300, // Light weight
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          _nextField(value: value, focusNode: _focusNode5);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 272,
                    top: 310,
                    child: GestureDetector(
                      onTap: () {
                        // Check if OTP is correct (demo: 12345)
                        if (_otpController1.text == '1' &&
                            _otpController2.text == '2' &&
                            _otpController3.text == '3' &&
                            _otpController4.text == '4' &&
                            _otpController5.text == '5') {
                          // Navigate to Dashboard if OTP is correct
                          Navigator.pushReplacementNamed(context, '/mainlogo');
                        } else {
                          // Show error message and reset OTP fields
                          setState(() {
                            _showError = true;
                          });
                          _otpController1.clear();
                          _otpController2.clear();
                          _otpController3.clear();
                          _otpController4.clear();
                          _otpController5.clear();
                          _focusNode1.requestFocus();
                        }
                      },
                      child: Container(
                        width: 22,
                        height: 32,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Next.png"), // Replace with your image asset path
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Error message
                  if (_showError)
                    Positioned(
                      left: 30,
                      top: 220,
                      child: SizedBox(
                        width: 253,
                        height: 20,
                        child: Text(
                          'Incorrect OTP. Please try again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
