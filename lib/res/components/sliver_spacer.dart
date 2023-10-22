import 'package:flutter/material.dart';
class SliverSpacer extends StatelessWidget {
  double height;
  double width;
  SliverSpacer({
    super.key,
    this.height=1,
    this.width=1,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
