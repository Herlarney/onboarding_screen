import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_assignment/util/constan.dart';
import 'package:onboarding_assignment/model/content_model.dart';
import 'package:onboarding_assignment/ui/homepage/homepage.dart';

import '../../util/customText/customtext.dart';

const activeColour = Colors.deepOrange;
const inactiveColour = Colors.orange;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: ((_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            contents[i].image!,
                            height: 300,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            label: contents[i].title!,
                            textStyle: kLabelTextStyleA,
                          ),
                          CustomText(
                            label: contents[i].description!,
                            textStyle: kLabelTextStyleB,
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => builddot(index, context),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  _controller.nextPage(
                      duration: Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  }
                },
                child: Text(
                  currentIndex == contents.length - 1 ? 'Continue' : 'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container builddot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 15 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? activeColour : inactiveColour,
      ),
      margin: EdgeInsets.only(right: 5),
    );
  }
}
