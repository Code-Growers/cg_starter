import 'package:cg_starter/widgets/home/greetings_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GreetingsText(),
      ),
    );
  }
}
