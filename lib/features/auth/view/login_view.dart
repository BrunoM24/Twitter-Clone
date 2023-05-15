import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appBar = UIConstants.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
    );
  }
}
