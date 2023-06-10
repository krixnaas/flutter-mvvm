import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({Key? key, this.topBefore, this.bottomBefore, this.leftBefore, this.rightBefore, this.topAfter, this.bottomAfter, this.leftAfter, this.rightAfter}) : super(key: key);
  final double? topBefore, bottomBefore, leftBefore, rightBefore;
  final double? topAfter, bottomAfter, leftAfter, rightAfter;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
