import 'package:flutter/material.dart';

class SnackShopPage extends StatelessWidget {
  const SnackShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Shop'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Snack Shop!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add more UI components as needed for the snack shop page
          ],
        ),
      ),
    );
  }
}
