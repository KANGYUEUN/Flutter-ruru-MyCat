import 'package:flutter/material.dart';

class HeartShopPage extends StatelessWidget {
  const HeartShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Shop'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Heart Shop!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add more UI components as needed for the heart shop page
          ],
        ),
      ),
    );
  }
}
