import 'package:flutter/material.dart';

class MobileFormLayout extends StatelessWidget {
  final Widget? child;
  const MobileFormLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double smallSzieThreshold = 550;
    double layoutWidth =
        screenWidth > smallSzieThreshold ? smallSzieThreshold : screenWidth;

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: SizedBox(
          width: layoutWidth,
          child: child,
        ),
      ),
    );
  }
}
