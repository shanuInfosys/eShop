import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class user_Home_Page extends StatefulWidget {
  const user_Home_Page({super.key});

  @override
  State<user_Home_Page> createState() => _user_Home_PageState();
}

class _user_Home_PageState extends State<user_Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome Home")),
    );
  }
}
