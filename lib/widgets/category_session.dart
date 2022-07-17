import 'package:coffee_shop/constants/coffee.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/repositories/coffee.dart';
import 'package:coffee_shop/widgets/coffee_filters.dart';
import 'package:coffee_shop/widgets/coffee_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySession extends StatefulWidget {
  const CategorySession({Key? key}) : super(key: key);

  @override
  State<CategorySession> createState() => _CategorySessionState();
}

class _CategorySessionState extends State<CategorySession> {
  CoffeeRepository coffeeRepository = CoffeeRepository();
  CoffeeConstants coffeeConstants = CoffeeConstants();

  Future<List<Coffee>>? fetchCoffeeData;

  @override
  void initState() {
    fetchCoffeeData = coffeeRepository.loadCoffes();

    super.initState();
  }

  void onFilterChange(String label) {
    if (label == "Cappuccino") {
      setState(() {
        fetchCoffeeData = coffeeRepository.loadCappuccinos();
      });
      return;
    }

    if (label == "Cold Brew") {
      setState(() {
        fetchCoffeeData = coffeeRepository.loadColdBrew();
      });
      return;
    }

    if (label == "Expresso") {
      setState(() {
        fetchCoffeeData = coffeeRepository.loadExpresso();
      });

      return;
    }

    setState(() {
      fetchCoffeeData = coffeeRepository.loadCoffes();
    });
  }

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
        const SizedBox(height: 16),
        CoffeeFilters(onFilter: onFilterChange),
        const SizedBox(height: 14),
        FutureBuilder<List<Coffee>>(
          initialData: const [],
          future: fetchCoffeeData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CoffeeList(
                aspectRatio: coffeeConstants.aspectRatio(),
                list: snapshot.data!,
              );
            }

            return const SizedBox(
              height: 200,
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
