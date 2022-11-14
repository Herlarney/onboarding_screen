import 'package:flutter/material.dart';
import 'package:onboarding_assignment/util/constan.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to homepage',
          style: kLabelTextStyleB,
        ),
      ),
    );
  }
}
