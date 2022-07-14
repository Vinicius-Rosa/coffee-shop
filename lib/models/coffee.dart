enum CoffeeType {
  capuccino,
  coldBrew,
  expresso,
}

enum CoffeeSize {
  small,
  medium,
  large,
}

class Coffee {
  String name;
  String detail;
  String description;
  CoffeeType type;
  CoffeeSize size;
  double value;

  Coffee({
    required this.name,
    required this.detail,
    required this.description,
    required this.type,
    required this.size,
    required this.value,
  });
}
