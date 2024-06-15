import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waiter_app/data/repositories/table_repository.dart';

import 'domain/entities/table_entity.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/order_screen.dart';
import 'presentation/bloc/table_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<TableRepository>(
      create: (context) => TableRepositoryImpl(),
      child: BlocProvider<TableBloc>(
        create: (context) => TableBloc(context.read<TableRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Waiter App',
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/order') {
              final table = settings.arguments as TableEntity;
              return MaterialPageRoute(
                builder: (context) {
                  return OrderScreen(table: table);
                },
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
