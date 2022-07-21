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
  Curve curve = Curves.easeOutSine;
  Duration animationDuration = const Duration(milliseconds: 600);
  double opacityController = 0;
  double paddingController = 0;

  void goToHome() {
    Navigator.pushNamed(context, "/home");
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacityController = 1;
      paddingController = 90;
    });
  }

  @override
  void initState() {
    super.initState();

    startAnimation();
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
          AnimatedOpacity(
            opacity: opacityController,
            duration: animationDuration,
            curve: curve,
            child: AnimatedPadding(
              duration: animationDuration,
              curve: curve,
              padding: EdgeInsets.only(bottom: paddingController),
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
          ),
        ],
      ),
    );
  }
}
