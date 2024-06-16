import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_app/presentation/screens/custom_drawer.dart';
import 'package:waiter_app/presentation/widgets/table_widget.dart';

import '../bloc/table_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Waiter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: BlocBuilder<TableBloc, TableState>(
          builder: (context, state) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 20,
                childAspectRatio: 4 / 3,
              ),
              itemCount: state.tables.length,
              itemBuilder: (context, index) {
                final table = state.tables[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/order', arguments: table);
                  },
                  child: TableWidget(table: table),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
