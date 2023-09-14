import 'package:flutter/material.dart';

class MyCatPage extends StatelessWidget {
  const MyCatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyCatPage"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("로그인 성공!"),
            // 다른 내용을 추가하세요.
          ],
        ),
      ),
    );
  }
}
