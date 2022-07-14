import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF6BE5F),
        borderRadius: BorderRadius.circular(60),
      ),
      child: const Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
