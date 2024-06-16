import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waiter_app/presentation/screens/order_screen.dart';
import 'package:waiter_app/presentation/bloc/table_bloc.dart';
import 'package:waiter_app/data/repositories/table_repository.dart';
import 'package:waiter_app/data/repositories/order_repository.dart';

import 'domain/entities/order_hive_entity.dart';
import 'domain/entities/table_entity.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/order_history.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OrderHiveEntityAdapter());
  Hive.registerAdapter(MealHiveEntityAdapter());
  Hive.registerAdapter(DrinkHiveEntityAdapter());

  final orderBox = await Hive.openBox<OrderHiveEntity>('orders');

  runApp(MyApp(orderBox: orderBox));
}

class MyApp extends StatelessWidget {
  final Box<OrderHiveEntity> orderBox;

  const MyApp({super.key, required this.orderBox});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<TableRepository>(
      create: (context) => TableRepositoryImpl(),
      child: RepositoryProvider<OrderRepository>(
        create: (context) => OrderRepositoryImpl(orderBox),
        child: BlocProvider<TableBloc>(
          create: (context) => TableBloc(
            context.read<TableRepository>(),
            context.read<OrderRepository>(),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Waiter App',
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeScreen(),
              '/order-history': (context) => const OrderHistoryScreen(),
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
      ),
    );
  }
}
