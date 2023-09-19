// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mycat/pages/my_cat_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ToyShopPage extends StatelessWidget {
  const ToyShopPage({super.key});

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
          'Toy Item shop  \u{26BD} ',
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
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/아크로바틱냥.png',
              width: 300,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20.0),
                children: [
                  buildGridItem(context, '캣닢',
                      'https://pethroom.com/product/detail.html?product_no=111&cate_no=208&display_group=1'),
                  buildGridItem(context, '낚시대',
                      'https://pethroom.com/product/detail.html?product_no=421&cate_no=108&display_group=1'),
                  buildGridItem(context, '스크래쳐',
                      'https://pethroom.com/product/detail.html?product_no=362&cate_no=208&display_group=1'),
                  buildGridItem(context, '캣 가구',
                      'https://www.iloom.com/product/item.do?categoryNo=639'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.0, // 바의 높이
        color: Colors.black.withOpacity(0.5), // 바의 배경색
        child: const Center(
          child: Text(
            'My cat loves chur  우리집 고양이 츄르를 좋아해 \u{1F63D}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'CatMainFont',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Could not launch the URL.'),
    ));
  }
}

GestureDetector buildGridItem(
    BuildContext context, String blockText, String url) {
  return GestureDetector(
    onTap: () {
      _launchURL(context, url);
    },
    child: Card(
      elevation: 2.0,
      child: Center(
        child: Text(
          blockText,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Color.fromARGB(255, 75, 73, 79),
          ),
        ),
      ),
    ),
  );
}
