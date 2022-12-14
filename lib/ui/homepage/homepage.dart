import 'package:flutter/material.dart';
import 'package:onboarding_assignment/util/constan.dart';

import '../../main.dart';
import '../../util/customText/customtext.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
            label: 'Welcome to HomePage',
            textStyle: kLabelTextStyleB,
          ),
          backgroundColor: Colors.deepOrange),
    );
  }
}
