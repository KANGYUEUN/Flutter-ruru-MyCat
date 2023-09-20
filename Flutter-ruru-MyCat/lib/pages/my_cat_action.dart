import 'package:flutter/material.dart';
import 'package:mycat/pages/heart_shop_page.dart';

class MyCatActionPage extends StatefulWidget {
  const MyCatActionPage({super.key});

  @override
  State<MyCatActionPage> createState() => _MyCatActionPageState();
}

class _MyCatActionPageState extends State<MyCatActionPage> {
  int heartsCount = 0;

  void deductHearts(int amount) {
    setState(() {
      if (heartsCount >= amount) {
        heartsCount -= amount;
      }
    });
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
        title: const Text(
          "냥에게 \u{2764} \u{2764} \u{2764} 를 주라냥 ",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.hdr_enhanced_select_outlined,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HeartShopPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ActionItem(
              title: '간식주기 \u{1F481}',
              heartsDeducted: 10,
              onPressed: () {
                deductHearts(10);
              },
            ),
            ActionItem(
              title: '빗질하기 \u{1F488}',
              heartsDeducted: 5,
              onPressed: () {
                deductHearts(5);
              },
            ),
            ActionItem(
              title: '냥젤리관리 \u{1F43E}',
              heartsDeducted: 8,
              onPressed: () {
                deductHearts(8);
              },
            ),
            ActionItem(
              title: '해드번팅 	\u{1F44A}',
              heartsDeducted: 10,
              onPressed: () {
                deductHearts(10);
              },
            ),
            ActionItem(
              title: '발톱정리 \u{1F463}',
              heartsDeducted: 5,
              onPressed: () {
                deductHearts(5);
              },
            ),
            const SizedBox(height: 60),
            CatAction(heartsCount: heartsCount),
          ],
        ),
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  final String title;
  final int heartsDeducted;
  final Function onPressed;

  const ActionItem({
    super.key,
    required this.title,
    required this.heartsDeducted,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('♥ -$heartsDeducted '),
      trailing: IconButton(
        icon: const Icon(Icons.h_plus_mobiledata),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class CatAction extends StatelessWidget {
  final int heartsCount;

  const CatAction({super.key, required this.heartsCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '현재 하트 개수: $heartsCount',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 61),
        Image.asset('assets/놀라는고영.png')
      ],
    );
  }
}
