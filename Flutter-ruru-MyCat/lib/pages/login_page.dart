// ignore_for_file: use_build_context_synchronously

import 'package:mycat/modules/validate.dart';
import 'package:mycat/pages/join_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../modules/input_form_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {super.key, required this.authUser, required this.updateAuthUser});

  // State<> 클래스 위젯에 함수를 전달 하기 위하여 선언하기
  final Function(User? user) updateAuthUser;
  final User? authUser;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("로그인"),
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
                  helpText: "이메일 형식에 맞게 입력하세요"),
              inputFormField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helpText: "비밀번호는 특수문자, 영문자, 숫자 포함 8자 이상으로 입력해 주세요",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              // 로그인버튼
              loginButton(),
              // 회원가입 버튼
              joinButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              backgroundColor: Colors.green,
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
              style: TextStyle(fontSize: 15),
            ),
          )),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () async {
            _formKey.currentState?.validate();
            var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: _emailValue,
              password: _passwordValue,
            );

            // result.user != null ? true : false
            // Navigator.pop(context.데이터) : 현재 화면이 닫힐때
            // 현재 화면을 열였던 곳으로 데이터를 return 해라
            Navigator.pop(context, result.user != null);
            await widget.updateAuthUser(result.user);
            // setState(() {});
          },
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              "로그인",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          )),
    );
  }
}
