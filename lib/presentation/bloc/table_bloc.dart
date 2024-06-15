import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_app/domain/entities/table_entity.dart';

import '../../data/repositories/table_repository.dart';

// Define Events
abstract class TableEvent {}

class IncrementMeal extends TableEvent {
  final int tableId;
  final String mealName;

  IncrementMeal(this.tableId, this.mealName);
}

class DecrementMeal extends TableEvent {
  final int tableId;
  final String mealName;

  DecrementMeal(this.tableId, this.mealName);
}

class IncrementDrink extends TableEvent {
  final int tableId;
  final String drinkName;

  IncrementDrink(this.tableId, this.drinkName);
}

class DecrementDrink extends TableEvent {
  final int tableId;
  final String drinkName;

  DecrementDrink(this.tableId, this.drinkName);
}

// Define State
class TableState {
  final List<TableEntity> tables;

  TableState(this.tables);
}

// Define Bloc
class TableBloc extends Bloc<TableEvent, TableState> {
  final TableRepository repository;

  TableBloc(this.repository)
      : super(TableState(repository.getTables())) {
    on<IncrementMeal>(_incrementMeal);
    on<DecrementMeal>(_decrementMeal);
    on<IncrementDrink>(_incrementDrink);
    on<DecrementDrink>(_decrementDrink);
  }

  void _incrementMeal(IncrementMeal event, Emitter<TableState> emit) {
    var table = state.tables.firstWhere((table) => table.id == event.tableId);
    var meal = table.meals.firstWhere((meal) => meal.name == event.mealName);
    meal.quantity++;
    emit(TableState(List.from(state.tables)));
  }

  void _decrementMeal(DecrementMeal event, Emitter<TableState> emit) {
    var table = state.tables.firstWhere((table) => table.id == event.tableId);
    var meal = table.meals.firstWhere((meal) => meal.name == event.mealName);
    if (meal.quantity > 0) {
      meal.quantity--;
    }
    emit(TableState(List.from(state.tables)));
  }

  void _incrementDrink(IncrementDrink event, Emitter<TableState> emit) {
    var table = state.tables.firstWhere((table) => table.id == event.tableId);
    var drink = table.drinks.firstWhere((drink) => drink.name == event.drinkName);
    drink.quantity++;
    emit(TableState(List.from(state.tables)));
  }

  void _decrementDrink(DecrementDrink event, Emitter<TableState> emit) {
    var table = state.tables.firstWhere((table) => table.id == event.tableId);
    var drink = table.drinks.firstWhere((drink) => drink.name == event.drinkName);
    if (drink.quantity > 0) {
      drink.quantity--;
    }
    emit(TableState(List.from(state.tables)));
  }
}
