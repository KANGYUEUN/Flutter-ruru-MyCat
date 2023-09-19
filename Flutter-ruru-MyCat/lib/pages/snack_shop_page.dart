// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mycat/pages/my_cat_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackShopPage extends StatelessWidget {
  const SnackShopPage({super.key});

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
          'Cat Snack shop  \u{1F41F}',
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
          SnackList(),
          Center(
            child: Image.asset(
              'assets/픽셀하트.png',
              width: 70,
              height: 70,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/힙터지는고양.png",
            ),
          ),
        ],
      ),
    );
  }
}

class SnackList extends StatelessWidget {
  SnackList({super.key});

  final List<Map<String, String>> snackItems = [
    {
      'name': '우리고양이사료',
      'url': 'https://www.dongwonmall.com/product/detail.do?productId=003598357'
    },
    {
      'name': '츄르',
      'url':
          'https://www.dongwonmall.com/product/detail.do?productId=003573664&cate_id='
    },
    {
      'name': '캣트릿',
      'url':
          'https://www.dongwonmall.com/product/detail.do?productId=003598574&cate_id='
    },
    {
      'name': '캣밀크',
      'url':
          'https://drholipet.com/category/%EB%8B%A5%ED%84%B0%ED%95%A0%EB%A6%AC-%ED%8E%AB%EB%B0%80%ED%81%AC-%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC%EC%A0%84%EC%9A%A9/55/'
    },
    {
      'name': '습식캔',
      'url':
          'https://www.dongwonmall.com/product/detail.do?productId=003613314&cate_id='
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: snackItems.length,
        itemBuilder: (context, index) {
          final snack = snackItems[index];
          return ListTile(
            title: Text(
              snack['name']!,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'CatMainFont',
              ),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              _launchURL(context, snack['url']!);
            },
          );
        },
      ),
    );
  }
}

void _launchURL(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('지금은 연결이 어렵다냥 \u{1F63F}'),
      ),
    );
  }
}
