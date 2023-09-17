// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycat/modules/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../modules/input_form_filed.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key, required this.updateAuthUser});

  // State<> 클래스 위젯에 함수를 전달 하기 위하여 선언하기
  final Function(User? user) updateAuthUser;
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _nameFocus = FocusNode();
  final _catnameFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";
  String _nameValue = "";
  String _catnameValue = "";

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
          "Cat-Join ♥",
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
              // 이메일
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailCheck(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "이메일",
                  helpText: "이메일 형식에 맞게 입력하라냥 !"),
              // 비밀번호
              inputFormField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helpText: "비밀번호는 특수문자, 영문자, 숫자 포함 8자 이상으로 입력하라냥 !",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              // 집사이름
              inputFormField(
                  focusNode: _nameFocus,
                  setValue: (value) => _nameValue = value,
                  validator: (value) => null,
                  hintText: "집사이름",
                  helpText: "cat slave name"),
              // MyCat-name
              inputFormField(
                  focusNode: _catnameFocus,
                  setValue: (value) => _catnameValue = value,
                  validator: (value) => null,
                  hintText: "MyCat-name ♡",
                  helpText: "juinnim"),

              joinButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/뚫고나오는고냥.png',
                  width: 200,
                  height: 150,
                ),
              ),
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
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          onPressed: () async {
            _formKey.currentState?.validate();

            try {
              var result =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailValue,
                password: _passwordValue,
              );
              widget.updateAuthUser(result.user);
              // email, password 이외의 회원정보를 저장하려면 fireStore  에 저장을 해야함.
              if (result.user != null) {
                await FirebaseFirestore.instance
                    .collection("user")
                    .doc(result.user!.uid)
                    .set({
                  "email": result.user!.email,
                  "name": _nameValue,
                  "tel": "010-1111-1111",
                });
              }
            } on FirebaseException catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(e.message!),
              ));
            }

            Navigator.pop(context);
          },
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              "회원가입",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'CatChatFont',
              ),
            ),
          )),
    );
  }
}
