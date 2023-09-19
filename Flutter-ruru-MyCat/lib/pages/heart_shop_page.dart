import 'package:flutter/material.dart';
import 'package:mycat/pages/my_cat_page.dart';

class HeartShopPage extends StatelessWidget {
  const HeartShopPage({super.key});

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
          'Heart Item shop	\u{2764} ',
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
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          const HeartList(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/3D하트산.png",
            ),
          ),
        ],
      ),
    );
  }
}

class HeartList extends StatelessWidget {
  const HeartList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HeartItem(),
            SizedBox(height: 10),
            HeartItem(),
            SizedBox(height: 10),
            HeartItem(),
          ],
        ),
      ),
    );
  }
}

class HeartItem extends StatelessWidget {
  const HeartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/블랙하트.png',
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 20),
          const Center(
            child: Text(" 	\u{2716}  000"),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.shopify_outlined),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
      ),
    );
  }
}
