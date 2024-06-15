class TableEntity {
  final int id;
  final List<Meal> meals;
  final List<Drink> drinks;

  TableEntity({
    required this.id,
    required this.meals,
    required this.drinks,
  });
}

class Meal {
  final String name;
  int quantity;

  Meal({required this.name, this.quantity = 0});
}

class Drink {
  final String name;
  int quantity;

  Drink({required this.name, this.quantity = 0});
}
