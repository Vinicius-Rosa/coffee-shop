import 'package:coffee_shop/models/filter.dart';
import 'package:coffee_shop/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class CoffeeFilters extends StatefulWidget {
  const CoffeeFilters({Key? key}) : super(key: key);

  @override
  State<CoffeeFilters> createState() => _CoffeeFiltersState();
}

class _CoffeeFiltersState extends State<CoffeeFilters> {
  String activeLabel = "Cappuccino";
  List<Filter> filterList = [
    Filter(label: "Cappuccino", assetName: "images/icons/Cappuccino.svg"),
    Filter(label: "Cold Brew", assetName: "images/icons/Cold Brew.svg"),
    Filter(label: "Expresso", assetName: "images/icons/Expresso.svg"),
  ];

  void onSelectItem(String retriveLabel) {
    setState(() {
      activeLabel = retriveLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 500,
        height: 40,
        child: Row(
          children: List.generate(
            filterList.length,
            (index) => FilterButton(
              label: filterList[index].label,
              assetName: filterList[index].assetName,
              activeItem: activeLabel,
              onPressed: onSelectItem,
            ),
          ),
        ),
      ),
    );
  }
}
