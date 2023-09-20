// ignore_for_file: library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mycat/pages/cat_heart_rank.dart';
import 'package:mycat/pages/my_cat_action.dart';
import 'package:mycat/pages/shop_page.dart';

class MyCatPage extends StatefulWidget {
  final String userName; // CatPage 에 login한 userName

  const MyCatPage({Key? key, required this.userName}) : super(key: key);

  @override
  _MyCatPageState createState() => _MyCatPageState();
}

class _MyCatPageState extends State<MyCatPage> {
  int heartCount = 0;
  late Timer _timer;

  void onIcon1Pressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyCatActionPage(),
      ),
    );
  }

  void onIcon2Pressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: const Icon(Icons.sports_handball_rounded),
              label: const Text(
                '공놀이',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: const Icon(Icons.sports_cricket_outlined),
              label: const Text(
                '낚시대',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: const Icon(Icons.toys_outlined),
              label: const Text(
                '장난감',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'CatMainFont',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onIcon3Pressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CatHeartRankPage(),
      ),
    );
  }

  void _incrementHeartCount() {
    setState(() {
      heartCount++;
    });
  }

  void _decrementHeartCount(Timer timer) {
    setState(() {
      if (heartCount > 0) {
        heartCount--;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), _decrementHeartCount);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                text: widget.userName,
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
      body: GestureDetector(
        onTap: _incrementHeartCount,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/기본말풍선.png',
                    width: 300,
                    height: 200,
                  ),
                  Text(
                    '\u{2764} : $heartCount',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'CatMainFont',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/치즈태비.png",
                  width: 390,
                  height: 380,
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
