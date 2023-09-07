import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatMainPage(),
    );
  }
}

class CatMainPage extends StatefulWidget {
  const CatMainPage({super.key});

  @override
  State<CatMainPage> createState() => _CatMainPageState();
}

class _CatMainPageState extends State<CatMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                  fontFamily: 'CatMainFont', color: Colors.black),
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                      "Hello my slave, work for me and earn money for me. Hello my slave, work for me and earn money for me. Hello my slave, work for me and earn money for me. Hello my slave, work for me and earn money for me. ",
                      speed: const Duration(milliseconds: 50),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " ♥ Cat In My Phone ♥",
              style: TextStyle(fontFamily: 'CatMainFont', fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
