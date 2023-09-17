// ignore_for_file: use_build_context_synchronously

import 'package:mycat/modules/validate.dart';
import 'package:mycat/pages/join_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mycat/pages/my_cat_page.dart';
import '../modules/input_form_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key, required this.authUser, required this.updateAuthUser});

  final Function(User? user) updateAuthUser;
  final User? authUser;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Cat-Login ♥",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'CatMainFont',
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailCheck(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "이메일",
                  helpText: "이메일 형식에 맞게 입력하라냥"),
              inputFormField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helpText: "비밀번호는 특수문자, 영문자, 숫자 포함 8자 이상으로 입력하라냥 ",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              loginButton(),
              joinButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/뚫고나오는고냥.png',
                  width: 300,
                  height: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showAlertDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('로그인 실패'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('알겠다냥'),
              onPressed: () {
                Navigator.of(context).pop(); // 알림 창 닫기
              },
            ),
          ],
        );
      },
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () async {
            _formKey.currentState?.validate() == true;
            try {
              var result =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailValue,
                password: _passwordValue,
              );
              if (result.user != null) {
                // 로그인 성공 시 MyCatPage로 이동
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyCatPage(),
                  ),
                );
              }
            } catch (e) {
              // 로그인 실패 시 에러 메시지를 알림 창으로 표시
              showAlertDialog('로그인에 실패했다냥 \u{1F63C} 재시도 하라냥 !');
            }
          },
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              "로그인",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'CatChatFont',
              ),
            ),
          )),
    );
  }

  // 회원가입 버튼
  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              backgroundColor: const Color.fromARGB(255, 76, 75, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          onPressed: () async {
            _formKey.currentState?.validate();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  JoinPage(updateAuthUser: widget.updateAuthUser),
            ));
          },
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              "회원가입",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'CatChatFont',
              ),
            ),
          )),
    );
  }
}
