import 'package:coffee_shop/models/coffee.dart';

class CoffeeRepository {
  final List<Coffee> _coffeList = [];
  final List<Coffee> _repositoryCoffeeList = [
    Coffee(
      name: "Cappuccino",
      detail: "With Chocolate",
      imageUrl:
          "https://images.unsplash.com/photo-1572442388796-11668a67e53d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=635&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.cappuccino,
      value: 50,
    ),
    Coffee(
      name: "Cappuccino",
      detail: "With Low Fat Milk",
      imageUrl:
          "https://images.unsplash.com/photo-1534687941688-651ccaafbff8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.cappuccino,
      value: 45,
    ),
    Coffee(
      name: "Black Coffee",
      detail: "Simple",
      imageUrl:
          "https://images.unsplash.com/photo-1559496417-e7f25cb247f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.expresso,
      value: 10,
    ),
    Coffee(
      name: "Special Cold Brew",
      detail: "With Milk",
      imageUrl:
          "https://images.unsplash.com/photo-1575026469075-99e9e3433e72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.coldBrew,
      value: 22,
    ),
    Coffee(
      name: "Normal Expresso",
      detail: "Without Milk",
      imageUrl:
          "https://images.unsplash.com/photo-1503240778100-fd245e17a273?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.expresso,
      value: 22,
    ),
    Coffee(
      name: "Special Expresso",
      detail: "With Milk and Draws",
      imageUrl:
          "https://images.unsplash.com/photo-1460865332492-81fd69fc5996?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.expresso,
      value: 38,
    ),
  ];

  Future<List<Coffee>> loadCoffes() async {
    await Future.delayed(const Duration(seconds: 2));
    _coffeList.replaceRange(0, _coffeList.length, _repositoryCoffeeList);

    return _coffeList;
  }

  List<Coffee> _loadBy(CoffeeType coffeeType) {
    final filteredList = _repositoryCoffeeList.where((element) {
      return element.type == coffeeType;
    }).toList();

    return filteredList;
  }

  Future<List<Coffee>> loadCappuccinos() async {
    await Future.delayed(const Duration(seconds: 1));
    final retriveList = _loadBy(CoffeeType.cappuccino);

    _coffeList.replaceRange(0, _coffeList.length, retriveList);

    return _coffeList;
  }

  Future<List<Coffee>> loadColdBrew() async {
    await Future.delayed(const Duration(seconds: 1));
    final retriveList = _loadBy(CoffeeType.coldBrew);

    _coffeList.replaceRange(0, _coffeList.length, retriveList);

    return _coffeList;
  }

  Future<List<Coffee>> loadExpresso() async {
    await Future.delayed(const Duration(seconds: 1));
    final retriveList = _loadBy(CoffeeType.expresso);

    _coffeList.replaceRange(0, _coffeList.length, retriveList);

    return _coffeList;
  }

  Future<Coffee> getSpecialCoffeeOffer() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    Coffee specialOffer = Coffee(
      name: "Special Cold Brew",
      detail: "With Milk",
      imageUrl:
          "https://images.unsplash.com/photo-1575026469075-99e9e3433e72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. ",
      type: CoffeeType.coldBrew,
      value: 22,
    );

    return specialOffer;
  }
}
