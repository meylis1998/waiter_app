import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_app/domain/entities/table_entity.dart';
import '../bloc/table_bloc.dart';

class OrderScreen extends StatelessWidget {
  final TableEntity table;

  const OrderScreen({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table ${table.id} Order'),
      ),
      body: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          final updatedTable = state.tables.firstWhere((t) => t.id == table.id);
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...updatedTable.meals.map((meal) => ListTile(
                          title: Text(meal.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  context.read<TableBloc>().add(DecrementMeal(
                                      updatedTable.id, meal.name));
                                },
                              ),
                              Text(
                                '${meal.quantity}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<TableBloc>().add(IncrementMeal(
                                      updatedTable.id, meal.name));
                                },
                              ),
                            ],
                          ),
                        )),
                    ...updatedTable.drinks.map((drink) => ListTile(
                          title: Text(drink.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  context.read<TableBloc>().add(DecrementDrink(
                                      updatedTable.id, drink.name));
                                },
                              ),
                              Text(
                                '${drink.quantity}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  context.read<TableBloc>().add(IncrementDrink(
                                      updatedTable.id, drink.name));
                                },
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 400),
                child: FilledButton(
                  onPressed: () {
                    context.read<TableBloc>().add(PlaceOrder(table.id));

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order success!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50)),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
