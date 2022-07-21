import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/utils/currency.dart';
import 'package:coffee_shop/widgets/size_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailScreen extends StatefulWidget {
  const CoffeeDetailScreen({Key? key}) : super(key: key);

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  double cardYPosition = 0;
  double opacity = 0;

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      cardYPosition = -25.0;
      opacity = 1;
    });
  }

  @override
  void initState() {
    super.initState();

    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final coffee = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Hero(
                  tag: "hero_tag-${coffee.imageUrl}",
                  child: Image(
                    image: NetworkImage(coffee.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF846046),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: AnimatedOpacity(
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 200),
                  opacity: opacity,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coffee.name,
                              style: GoogleFonts.lato(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text(coffee.detail,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedContainer(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0.0, cardYPosition, 0.0),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coffee size",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizeSelect(),
                  const SizedBox(height: 16),
                  Text(
                    "Description",
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(coffee.description),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFF846046),
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Add to Cart",
                                style: GoogleFonts.lato(
                                  color: const Color(0xFFF8F7FA),
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                Currency().format(coffee.value),
                                style: GoogleFonts.lato(
                                  color: const Color(0xFFF8F7FA),
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
