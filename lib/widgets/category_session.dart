import 'package:coffee_shop/constants/coffee.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/repositories/coffee.dart';
import 'package:coffee_shop/widgets/coffee_item.dart';
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
              final coffeList = snapshot.data;
              final coffeListLength = coffeList!.length;

              return GridView.builder(
                itemCount: coffeListLength,
                itemBuilder: (context, index) => CoffeeItem(
                  coffee: coffeList[index],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: coffeeConstants.aspectRatio(),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
