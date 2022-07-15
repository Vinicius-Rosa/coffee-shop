import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final coffee = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      body: Center(child: Text("Details of ${coffee.name}")),
    );
  }
}
