import 'package:flutter/material.dart';

class MyCatActionPage extends StatelessWidget {
  const MyCatActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cat Action Page'),
      ),
      body: const Center(
        child: Text(
          'This is the My Cat Action Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
