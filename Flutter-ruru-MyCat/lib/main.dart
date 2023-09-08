import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycat/firebase_options.dart';
import 'package:mycat/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  late User? _authUser;

  bool showStartCatText = false;

  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          LoginPage(authUser: _authUser, updateAuthUser: updateAuthUser),
    ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showStartCatText = true;
      });
    });

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _authUser = user;
      });
    });
  }

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
                      "   ♥ Hello my slave, work for me and earn money for me. ♥ "
                      "      안녕 나의 노예야 나를 위해 일하고 나를위해 돈을벌어라. ",
                      speed: const Duration(milliseconds: 50),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "  Cat In My Phone ",
                style: TextStyle(
                    fontFamily: 'CatMainFont',
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // mainCat 클릭시 LoginPage()
            GestureDetector(
              onTap: () {
                _navigateToLoginPage(context);
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset('assets/start_cat.png'),
                  AnimatedOpacity(
                    opacity: showStartCatText ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1), // 애니메이션 기간
                    child: const Text(
                      'Start Cat !',
                      style: TextStyle(
                        fontFamily: 'CatMainFont',
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: const <Widget>[
        Center(child: Text("Copyright 2023. KANGYUEUN all rights reserved."))
      ],
    );
  }
}
