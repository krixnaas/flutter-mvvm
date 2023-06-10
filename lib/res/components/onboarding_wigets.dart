
import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/sizes.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({
    super.key,
    required this.size,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.counter,
    required this.bgColor,
  });

  final Size size;
  final String imagePath;
  final String title;
  final String subTitle;
  final String counter;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image:AssetImage(imagePath), height:size.height*0.4,),
          Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineLarge,),
              Text(subTitle, textAlign: TextAlign.center,),
            ],
          ),
          Text(counter, style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 40.0,)
        ],
      ),);
  }
}
