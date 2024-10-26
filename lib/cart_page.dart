// cart_page.dart
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Text(
          'Your Cart is Empty',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
