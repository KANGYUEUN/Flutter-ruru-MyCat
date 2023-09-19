import 'package:flutter/material.dart';
import 'package:mycat/pages/my_cat_action.dart';
import 'package:mycat/pages/shop_page.dart';

class MyCatPage extends StatelessWidget {
  final String userName; // CatPage 에 login한 userName

  const MyCatPage({super.key, required this.userName});

  void onIcon1Pressed(BuildContext context) {
    // Example: Navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCatActionPage(),
      ),
    );
  }

  void onIcon2Pressed(BuildContext context) {
    // Example: Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Second icon button pressed')),
    );
  }

  void onIcon3Pressed(BuildContext context) {
    // Example: Navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCatActionPage(),
      ),
    );
  }

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
                'assets/기본말풍선.png',
                width: 300,
                height: 200,
              ),
              Positioned(
                bottom: -300,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/치즈태비.png",
                  width: 390,
                  height: 480,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.volunteer_activism_outlined),
              onPressed: () => onIcon1Pressed(context),
            ),
            IconButton(
              icon: const Icon(Icons.sports_basketball_rounded),
              onPressed: () => onIcon2Pressed(context),
            ),
            IconButton(
              icon: const Icon(Icons.list_rounded),
              onPressed: () => onIcon3Pressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
