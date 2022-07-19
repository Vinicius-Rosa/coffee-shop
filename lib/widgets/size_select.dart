import 'package:coffee_shop/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class SizeSelect extends StatefulWidget {
  const SizeSelect({Key? key}) : super(key: key);

  @override
  State<SizeSelect> createState() => _SizeSelectState();
}

class _SizeSelectState extends State<SizeSelect> {
  String _activeLabel = "Small";
  final List<String> _sizeList = ["Small", "Medium", "Large"];

  void onSelectItem(String retriveLabel) {
    String newLabel = retriveLabel;

    if (_activeLabel == retriveLabel) {
      newLabel = "";
    }

    setState(() {
      _activeLabel = newLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _sizeList.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 5),
          child: FilterButton(
            label: _sizeList[index],
            activeItem: _activeLabel,
            onPressed: onSelectItem,
          ),
        ),
      ),
    );
  }
}
