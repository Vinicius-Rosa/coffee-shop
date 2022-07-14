import 'package:coffee_shop/models/coffee.dart';

class CoffeeRepository {
  final List<Coffee> _coffeList = [];

  Future<List<Coffee>> loadCoffes() async {
    await Future.delayed(const Duration(seconds: 2));

    _coffeList.addAll([
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
    ]);

    return _coffeList;
  }

  Future<Coffee> getSpecialCoffeeOffer() async {
    await Future.delayed(const Duration(seconds: 2));

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
