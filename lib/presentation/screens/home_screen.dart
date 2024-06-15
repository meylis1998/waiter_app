import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/table_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiter App'),
      ),
      body: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tables.length,
            itemBuilder: (context, index) {
              final table = state.tables[index];
              return ListTile(
                title: Text('Table ${table.id}'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/order',
                    arguments: table,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
