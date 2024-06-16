import 'package:hive/hive.dart';
import 'package:waiter_app/domain/entities/table_entity.dart';

import '../../domain/entities/order_hive_entity.dart';

abstract class OrderRepository {
  Future<void> addOrder(int tableId, List<Meal> meals, List<Drink> drinks);
  Future<List<OrderHiveEntity>> getOrders();
}

class OrderRepositoryImpl extends OrderRepository {
  final Box<OrderHiveEntity> orderBox;

  OrderRepositoryImpl(this.orderBox);

  @override
  Future<void> addOrder(int tableId, List<Meal> meals, List<Drink> drinks) async {
    final mealHiveEntities = meals.map((meal) => MealHiveEntity(name: meal.name, quantity: meal.quantity)).toList();
    final drinkHiveEntities = drinks.map((drink) => DrinkHiveEntity(name: drink.name, quantity: drink.quantity)).toList();

    final order = OrderHiveEntity(
      tableId: tableId,
      meals: mealHiveEntities,
      drinks: drinkHiveEntities,
      timestamp: DateTime.now(),
    );

    await orderBox.add(order);
  }

  @override
  Future<List<OrderHiveEntity>> getOrders() async {
    return orderBox.values.toList();
  }
}
