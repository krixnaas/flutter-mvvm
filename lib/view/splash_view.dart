import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool animate=false;
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.startAnimate().then((value) {
      setState(() {
        animate = value; // Update the local animate variable in the widget's state
      });
      splashServices.checkAuthentication(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          AnimatedPositioned(
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              duration: const Duration(milliseconds: 1600),
              child: Image(image: AssetImage(tSplashTopIcon))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 140,
              left: animate ? tDefaultSize : -40,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(tAppTagLine,
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: animate ? 70 : -30,
              left: animate ? 30 : -30,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: animate ? 1 : 0,
                  child: Image(image: AssetImage(tSplashImage)))),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 70 : -30,
            right: tDefaultSize,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Container(
                width: tSplashContainerSize,
                height: tSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.tPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      );
  }
}
