import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/onboarding_wigets.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final liquidController = LiquidController();
  final onBoardingViewModel = Get.put(OnBoardingViewModel());
  @override
  Widget build(BuildContext context) {
    final pages = [
      onBoardingPageWidget(
          imagePath: onBoarding1,
          title: onBoardingTitle1,
          subTitle: onBoardingSubTitle1,
          counter: onBoardingCounter1,
          bgColor: AppColors.onBoardingPage1Color),
      onBoardingPageWidget(
          imagePath: onBoarding2,
          title: onBoardingTitle2,
          subTitle: onBoardingSubTitle2,
          counter: onBoardingCounter2,
          bgColor: AppColors.onBoardingPage2Color),
      onBoardingPageWidget(
          imagePath: onBoarding2,
          title: onBoardingTitle3,
          subTitle: onBoardingSubTitle3,
          counter: onBoardingCounter3,
          bgColor: AppColors.onBoardingPage3Color),
      onBoardingPageWidget(
          imagePath: onBoarding2,
          title: onBoardingTitle4,
          subTitle: onBoardingSubTitle4,
          counter: onBoardingCounter4,
          bgColor: AppColors.onBoardingPage4Color),
    ];
    return Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: pages,
          slideIconWidget: Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
          liquidController: liquidController,
          onPageChangeCallback: (int index) {
            print(index);
            onBoardingViewModel.activeIndex = index;
          },
        ),
        Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                onBoardingViewModel.jumpToNext();
                liquidController.animateToPage(
                    page: liquidController.currentPage + 1);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: AppColors.tDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            )),
        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
            onPressed: () {
              Get.toNamed(RoutesName.login);
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: AnimatedSmoothIndicator(
            activeIndex: onBoardingViewModel.activeIndex,
            count: pages.length,
            effect: const WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
