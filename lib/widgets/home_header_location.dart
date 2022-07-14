import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeaderLocation extends StatelessWidget {
  String location;
  HomeHeaderLocation({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.pin_drop,
          color: Color(0xFF846046),
        ),
        const SizedBox(width: 4),
        Text(
          location,
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
