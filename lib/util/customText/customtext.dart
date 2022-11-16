import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? label;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const CustomText({
    this.label,
    this.textStyle,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
