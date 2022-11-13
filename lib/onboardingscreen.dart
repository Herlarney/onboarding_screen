import 'package:flutter/material.dart';
import 'package:onboarding_assignment/constan.dart';
import 'package:onboarding_assignment/content_model.dart';
import 'package:onboarding_assignment/homepage.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
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
                        Text(
                          contents[i].title!,
                          style: kLabelTextStyleA,
                        ),
                        Text(
                          contents[i].description!,
                          style: kLabelTextStyleB,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }),
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
                color: Theme.of(context).primaryColor,
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
                    currentIndex == contents.length - 1 ? 'continue' : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
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
        color: Theme.of(context).primaryColor,
      ),
      margin: EdgeInsets.only(right: 5),
    );
  }
}
