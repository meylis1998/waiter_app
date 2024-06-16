import 'package:flutter/material.dart';

import 'order_history.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryScreen(),
                  ),
                );
              },
              child: const Text('Order history'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Categories'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('FAQ'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Categories'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('FAQ'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Categories'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('FAQ'),
            ),
          ],
        ),
      ),
    );
  }
}
