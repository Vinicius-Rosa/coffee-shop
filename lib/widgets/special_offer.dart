import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/repositories/coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOffer extends StatelessWidget {
  SpecialOffer({Key? key}) : super(key: key);

  CoffeeRepository coffeeRepository = CoffeeRepository();

  @override
  Widget build(BuildContext context) {
    void goToDetails(Coffee coffee) {
      Navigator.pushNamed(context, "/coffee-detail", arguments: coffee);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Special Offer 🔥",
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        FutureBuilder<Coffee>(
            future: coffeeRepository.getSpecialCoffeeOffer(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Coffee? coffee = snapshot.data;

                return GestureDetector(
                  onTap: () {
                    goToDetails(coffee as Coffee);
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              coffee!.imageUrl,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 120,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF846046),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "Limited",
                                    style: GoogleFonts.lato(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                Text(
                                  "Buy 1 get 1 free if you buy with Gopay",
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return const SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            })
      ],
    );
  }
}
