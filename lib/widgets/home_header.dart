import 'package:coffee_shop/models/user.dart';
import 'package:coffee_shop/widgets/home_header_location.dart';
import 'package:coffee_shop/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late User _user;

  @override
  void initState() {
    _user = User(location: "Muqui, ES", name: "Vinicius");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProfileImage(),
            HomeHeaderLocation(location: _user.location)
          ],
        ),
        const SizedBox(height: 14),
        Text(
          "Good morning, ${_user.name}",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
