import 'package:hive/hive.dart';

part 'order_hive_entity.g.dart';

@HiveType(typeId: 0)
class OrderHiveEntity extends HiveObject {
  @HiveField(0)
  final int tableId;

  @HiveField(1)
  final List<MealHiveEntity> meals;

  @HiveField(2)
  final List<DrinkHiveEntity> drinks;

  @HiveField(3)
  final DateTime timestamp;

  OrderHiveEntity({
    required this.tableId,
    required this.meals,
    required this.drinks,
    required this.timestamp,
  });
}

@HiveType(typeId: 1)
class MealHiveEntity extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int quantity;

  MealHiveEntity({required this.name, required this.quantity});
}

@HiveType(typeId: 2)
class DrinkHiveEntity extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int quantity;

  DrinkHiveEntity({required this.name, required this.quantity});
}
