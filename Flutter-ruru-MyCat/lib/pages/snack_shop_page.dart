import 'package:flutter/material.dart';
import 'package:mycat/pages/my_cat_page.dart';

class SnackShopPage extends StatelessWidget {
  const SnackShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cat Snack shop  \u{1F41F}',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCatPage(
                    userName: '',
                  ),
                ),
              );
            },
          ),
        ],
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
