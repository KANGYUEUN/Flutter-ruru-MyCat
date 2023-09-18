import 'package:flutter/material.dart';
import 'package:mycat/pages/heart_shop_page.dart';
import 'package:mycat/pages/snack_shop_page.dart';
import 'package:mycat/pages/toy_shop_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

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
          "Cat shop list - 사달라냥 \u{1F63D}",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text(
                'Heart Item 	\u{2764} ',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CatChatFont',
                ),
              ),
              subtitle: const Text(
                '게임내에서 사용하능한 하트라냥',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'CatChatFont',
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HeartShopPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Cat Toy \u{26BD} ',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CatChatFont',
                ),
              ),
              subtitle: const Text(
                '활동을 위한 모든거라냥',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'CatChatFont',
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToyShopPage()),
                );
              },
            ),
            const Divider(),

            // List block 3
            ListTile(
              title: const Text(
                'Cat Snack \u{1F41F}',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'CatChatFont',
                ),
              ),
              subtitle: const Text(
                '주인님이 좋아하는 냠냐미',
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'CatChatFont',
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SnackShopPage()),
                );
              },
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/택배고냥.png',
              width: 500,
              height: 480,
            ),
          ],
        ),
      ),
    );
  }
}
