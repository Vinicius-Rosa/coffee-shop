import 'package:coffee_shop/models/filter.dart';
import 'package:coffee_shop/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class CoffeeFilters extends StatefulWidget {
  CoffeeFilters({required this.onFilter, Key? key}) : super(key: key);

  void Function(String label) onFilter;

  @override
  State<CoffeeFilters> createState() => _CoffeeFiltersState();
}

class _CoffeeFiltersState extends State<CoffeeFilters> {
  String activeLabel = "";
  List<Filter> filterList = [
    Filter(label: "Cappuccino", assetName: "images/icons/Cappuccino.svg"),
    Filter(label: "Cold Brew", assetName: "images/icons/Cold Brew.svg"),
    Filter(label: "Expresso", assetName: "images/icons/Expresso.svg"),
  ];

  void onSelectItem(String retriveLabel) {
    String newLabel = retriveLabel;

    if (activeLabel == retriveLabel) {
      newLabel = "";
    }

    setState(() {
      widget.onFilter(newLabel);
      activeLabel = newLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        filterList.length,
        (index) => FilterButton(
          label: filterList[index].label,
          assetName: filterList[index].assetName,
          activeItem: activeLabel,
          onPressed: onSelectItem,
        ),
      ),
    );
  }
}
