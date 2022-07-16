import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/widgets/coffee_item.dart';
import 'package:flutter/material.dart';

class CoffeeList extends StatelessWidget {
  CoffeeList({
    required this.aspectRatio,
    required this.list,
    Key? key,
  }) : super(key: key);

  List<Coffee> list;
  double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => CoffeeItem(
        coffee: list[index],
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: aspectRatio,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 10,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
