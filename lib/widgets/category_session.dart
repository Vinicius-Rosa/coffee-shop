import 'package:coffee_shop/constants/coffee.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/repositories/coffee.dart';
import 'package:coffee_shop/widgets/coffee_item.dart';
import 'package:coffee_shop/widgets/coffee_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySession extends StatelessWidget {
  CoffeeRepository coffeeRepository = CoffeeRepository();
  CoffeeConstants coffeeConstants = CoffeeConstants();

  CategorySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        FutureBuilder<List<Coffee>>(
          initialData: const [],
          future: coffeeRepository.loadCoffes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CoffeeList(
                aspectRatio: coffeeConstants.aspectRatio(),
                list: snapshot.data!,
              );
            }

            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
