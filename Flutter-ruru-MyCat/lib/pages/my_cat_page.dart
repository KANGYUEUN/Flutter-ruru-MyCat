import 'package:flutter/material.dart';
import 'package:mycat/pages/shop_page.dart';

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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/heart_talk.png',
                width: 300,
                height: 200,
              ),
              Image.asset(
                "assets/치즈태비.png",
                width: 500,
                height: 500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
