import 'package:coffee_shop/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
          physics: const BouncingScrollPhysics(),
          children: const [HomeHeader()],
        ),
      ),
    );
  }
}
