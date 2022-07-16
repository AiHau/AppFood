import 'package:app_food/config/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: textColor,
        title: Text(
          "Privacy Policy",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            Strings.textPrivacyPolicy,
            style: GoogleFonts.mulish(
              fontSize: 17,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
