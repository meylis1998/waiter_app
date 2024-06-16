import '../../domain/entities/table_entity.dart';

abstract class TableRepository {
  List<TableEntity> getTables();
}

class TableRepositoryImpl extends TableRepository {
  @override
  List<TableEntity> getTables() {
    return [
      TableEntity(
        id: 1,
        meals: [Meal(name: 'Pasta'), Meal(name: 'Pizza')],
        drinks: [Drink(name: 'Water'), Drink(name: 'Soda')],
      ),
      TableEntity(
        id: 2,
        meals: [Meal(name: 'Burger'), Meal(name: 'Salad')],
        drinks: [Drink(name: 'Juice'), Drink(name: 'Wine')],
      ),
      TableEntity(
        id: 3,
        meals: [Meal(name: 'Plov'), Meal(name: 'Dograma')],
        drinks: [Drink(name: 'Water'), Drink(name: 'Soda')],
      ),
      TableEntity(
        id: 4,
        meals: [Meal(name: 'Cheeseburger'), Meal(name: 'Salad')],
        drinks: [Drink(name: 'Juice'), Drink(name: 'Wine')],
      ),
    ];
  }
}
