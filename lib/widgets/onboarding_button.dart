import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingButton extends StatelessWidget {
  void Function() onPressed;
  OnboardingButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFF846046),
          borderRadius: BorderRadius.circular(34),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              "Get Started",
              style: GoogleFonts.lato(
                color: const Color(0xFFF8F7FA),
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
