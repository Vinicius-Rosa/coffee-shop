import 'package:coffee_shop/routes/logged_stack.dart';
import 'package:coffee_shop/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: "/",
      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/home": (context) => const LoggedStack(),
        "/coffee-detail": (context) => const CoffeeDetailScreen(),
      },
    );
  }
}
