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
      body: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              childAspectRatio: 4 / 3,
            ),
            itemCount: state.tables.length,
            itemBuilder: (context, index) {
              final table = state.tables[index];
              // return ListTile(
              //   title: Text('Table ${table.id}'),
              //   onTap: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/order',
              //       arguments: table,
              //     );
              //   },
              // );
              return TableWidget(table: table);
            },
          );
        },
      ),
    );
  }
}
