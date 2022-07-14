import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF8F7FA),
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          border: Border.all(
            color: const Color(0xFFCBCBD4),
            width: 1.0,
          )),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Coffee...",
          hintStyle: GoogleFonts.lato(color: const Color(0xFFCBCBD4)),
          prefixIcon:
              const Icon(Icons.search_rounded, color: Color(0xFFA6A6AA)),
        ),
      ),
    );
  }
}
