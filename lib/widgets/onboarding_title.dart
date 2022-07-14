import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingTitle extends StatelessWidget {
  String title;
  OnboardingTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lato(
        color: const Color(0xFFCBCBD4),
        fontSize: 32,
      ),
    );
  }
}
