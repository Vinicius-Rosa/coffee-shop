import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButton extends StatelessWidget {
  FilterButton({
    required this.onPressed,
    required this.label,
    required this.assetName,
    required this.activeItem,
    this.semanticsLabel,
    Key? key,
  }) : super(key: key);

  void Function(String selectedLabel) onPressed;
  String label;
  String assetName;
  String activeItem;
  String? semanticsLabel = "";

  bool _isActive() => activeItem == label;

  Color _getBgColor() {
    if (_isActive()) {
      return const Color(0xFF846046);
    }

    return Colors.transparent;
  }

  Color _getTextColor() {
    if (_isActive()) {
      return Colors.white;
    }

    return const Color(0xFF3A3A3A);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: _getBgColor(),
        borderRadius: BorderRadius.circular(24),
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed(label);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              assetName,
              semanticsLabel: semanticsLabel,
              color: _getTextColor(),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.lato(
                color: _getTextColor(),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
