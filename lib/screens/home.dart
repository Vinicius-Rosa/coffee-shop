import 'package:coffee_shop/widgets/home_header.dart';
import 'package:coffee_shop/widgets/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
            physics: const BouncingScrollPhysics(),
            children: const [
              HomeHeader(),
              SizedBox(height: 32),
              Search(),
            ],
          ),
        ),
      ),
    );
  }
}
