import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/res/image_strings.dart';
import 'package:mvvm/res/sizes.dart';
import 'package:mvvm/res/text_strings.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(successTop),
            ),
            const SizedBox(height: tFormHeightSize),
            Text(
              registrationSuccess,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: tFormHeightSize,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RoundButtonWidget(
                title: login,
                onPress: () {
                  Get.toNamed(RoutesName.login)!.then((value) {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
