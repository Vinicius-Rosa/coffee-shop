import 'package:coffee_shop/constants/coffee.dart';
import 'package:coffee_shop/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeItem extends StatelessWidget {
  CoffeeConstants coffeeConstants = CoffeeConstants();
  Coffee coffee;
  Currency currency = Currency();

  CoffeeItem({required this.coffee, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void goToDetails() {
      Navigator.pushNamed(context, "/coffee-detail", arguments: coffee);
    }

    return GestureDetector(
      onTap: goToDetails,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: NetworkImage(coffee.imageUrl),
                  fit: BoxFit.cover,
                  height: 140,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                coffee.name,
                style: GoogleFonts.lato(fontSize: 18),
              ),
              const SizedBox(height: 2),
              Text(
                coffee.detail,
                style: GoogleFonts.lato(fontSize: 8),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currency.format(coffee.value),
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF846046),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
