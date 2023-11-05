import 'package:flutter/material.dart';
import 'package:mvvm/res/sizes.dart';

class onBoardingPageWidget extends StatelessWidget {
  const onBoardingPageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.counter,
    required this.bgColor,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final String counter;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage(imagePath),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          Text(
            counter,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}
