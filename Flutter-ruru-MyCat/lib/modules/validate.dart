import 'package:flutter/widgets.dart';

class CheckValidate {
  String? emailCheck({
    // ? = null 허용
    required String email,
    required FocusNode focusNode,
  }) {
    if (email.isEmpty) {
      focusNode.requestFocus();
      return "email 을 입력하라냥";
    } else {
      const pattern =
          r"^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";

      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(email)) {
        focusNode.requestFocus();
        return "이메일 형식이 잘 못 되었다냥";
      }
    }
    return null;
  }

  String? passwordCheck({
    required String password,
    required FocusNode focusNode,
  }) {
    if (password.isEmpty) {
      focusNode.requestFocus();
      return "비밀번호를 입력하라냥";
    } else {
      const pattern =
          r"^.*(?=^.{8,15}$)(?=.*d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$";
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(password)) {
        focusNode.requestFocus();
        return "특수문자 영문자 숫자 포함하여 8~15자리로 입력해야 한다냥";
      }
    }
    return null;
  }

  // play userName
  String? userNameCheck({
    required String name,
    required FocusNode focusNode,
  }) {
    if (name.isEmpty) {
      focusNode.requestFocus();
      return "집사이름을 입력하라냥";
    }
    return null;
  }

  // MyCat name
  String? catnameCheck({
    required String catname,
    required FocusNode focusNode,
  }) {
    if (catname.isEmpty) {
      focusNode.requestFocus();
      return "주인님이름을 입력하라냥";
    }
    return null;
  }
}
