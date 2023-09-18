import 'package:flutter/material.dart';

class ToyShopPage extends StatelessWidget {
  const ToyShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toy Shop'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Toy Shop!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add more UI components as needed for the toy shop page
          ],
        ),
      ),
    );
  }
}
