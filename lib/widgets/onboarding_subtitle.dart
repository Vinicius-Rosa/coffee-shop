import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSubtitle extends StatelessWidget {
  String subtitle;
  OnboardingSubtitle(this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }
}
