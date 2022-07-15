import 'package:coffee_shop/widgets/category_session.dart';
import 'package:coffee_shop/widgets/home_header.dart';
import 'package:coffee_shop/widgets/search.dart';
import 'package:coffee_shop/widgets/special_offer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            // shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 40),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const HomeHeader(),
                const SizedBox(height: 32),
                const Search(),
                const SizedBox(height: 32),
                SpecialOffer(),
                const SizedBox(height: 32),
                CategorySession(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
