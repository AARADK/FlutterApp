import 'package:flutter/material.dart';
import 'dart:io';

class ProfileDetails extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final TextEditingController nameController;
  final TextEditingController dobController;
  final TextEditingController pobController;
  final TextEditingController tobController;
  final File? imageFile;
  final Future<void> Function() pickImage;

  ProfileDetails({
    required this.screenWidth,
    required this.screenHeight,
    required this.nameController,
    required this.dobController,
    required this.pobController,
    required this.tobController,
    this.imageFile,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Color(0xFFF4DFC8).withOpacity(0.7),
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: imageFile != null
                        ? FileImage(imageFile!)
                        : AssetImage("assets/images/default_profile.png") as ImageProvider,
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextFieldWithIcon(nameController, Icons.person, 'Name', screenWidth, screenHeight),
                      SizedBox(height: screenHeight * 0.01),
                      _buildTextFieldWithIcon(dobController, Icons.calendar_today, 'Date of Birth', screenWidth, screenHeight),
                      SizedBox(height: screenHeight * 0.01),
                      _buildTextFieldWithIcon(pobController, Icons.place, 'Place of Birth', screenWidth, screenHeight),
                      SizedBox(height: screenHeight * 0.01),
                      _buildTextFieldWithIcon(tobController, Icons.access_time, 'Time of Birth', screenWidth, screenHeight),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(
      TextEditingController controller, IconData icon, String hintText, double screenWidth, double screenHeight) {
    return Row(
      children: [
        Icon(icon, color: Color(0xFFFF9933)),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.04,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
