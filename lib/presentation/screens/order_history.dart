import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_app/data/repositories/order_repository.dart';

import '../../domain/entities/order_hive_entity.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderRepository = RepositoryProvider.of<OrderRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: FutureBuilder<List<OrderHiveEntity>>(
        future: orderRepository.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('Table ${order.tableId}'),
                  subtitle: Text('Ordered on ${order.timestamp}'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Order Details'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...order.meals.map((meal) => Text('${meal.name}: ${meal.quantity}')),
                              ...order.drinks.map((drink) => Text('${drink.name}: ${drink.quantity}')),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
