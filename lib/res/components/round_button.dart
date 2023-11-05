import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/colors.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget(
      {Key? key,
      this.buttonColor = AppColors.tAccentColor,
      this.textColor = AppColors.blackColor,
      required this.title,
      this.height = 40,
      this.width = double.infinity,
      this.loading = false,
      required this.onPress})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(5)),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                    title.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
