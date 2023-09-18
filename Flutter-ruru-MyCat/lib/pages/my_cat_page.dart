import 'package:flutter/material.dart';

class MyCatPage extends StatelessWidget {
  final String userName; // CatPage 에 login한 userName

  const MyCatPage({super.key, required this.userName});

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
        title: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "MyCatPage :  ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: userName,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.red,
                ),
              ),
              const TextSpan(
                text: " 어서 와라냥 \u{1F63B}  ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("로그인 성공!"),
          ],
        ),
      ),
    );
  }
}
