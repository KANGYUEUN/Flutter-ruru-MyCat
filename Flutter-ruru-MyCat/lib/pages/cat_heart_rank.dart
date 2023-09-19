// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mycat/data/cat_data.dart';

class CatHeartRankPage extends StatelessWidget {
  const CatHeartRankPage({super.key});

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
          "명예의 RANK 전당이다냥 \u{26A1}",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: catData.length,
        itemBuilder: (context, index) {
          final cat = catData[index];
          return ListTile(
            leading: Text(
              (index + 1).toString(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'CatChatFont',
              ),
            ),
            title: Text(
              cat.name,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'CatChatFont',
              ),
            ),
            trailing: Text(
              '\u{2764} ${cat.heartCount}',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'CatChatFont',
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/머그샷고냥.png',
                width: 350,
                height: 350,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
