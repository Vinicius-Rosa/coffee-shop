import 'package:coffee_shop/widgets/onboarding_button.dart';
import 'package:coffee_shop/widgets/onboarding_subtitle.dart';
import 'package:coffee_shop/widgets/onboarding_title.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void goToHome() {
    Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage("images/onboarding-bg.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OnboardingTitle("Good coffee,"),
                  OnboardingTitle("Good friends,"),
                  OnboardingTitle("let it blends"),
                  const SizedBox(height: 16),
                  OnboardingSubtitle("The best grain, the finest roast, "),
                  OnboardingSubtitle("the most powerful flavor."),
                  const SizedBox(height: 36),
                  OnboardingButton(onPressed: goToHome)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
