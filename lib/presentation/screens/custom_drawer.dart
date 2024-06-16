import 'package:flutter/material.dart';

import '../widgets/drawer_button.dart';
import 'order_history.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDrawerButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryScreen(),
                  ),
                );
              },
              name: "Order History",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomDrawerButton(name: 'Categories', onPressed: () {}),
            ),
            CustomDrawerButton(onPressed: () {}, name: 'FAQ'),
          ],
        ),
      ),
    );
  }
}
