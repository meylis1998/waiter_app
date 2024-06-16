import 'package:flutter/material.dart';
import 'package:waiter_app/domain/entities/table_entity.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.table});

  final TableEntity table;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.table_restaurant_rounded, size: 40),
          Text(
            'Table ${table.id}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
