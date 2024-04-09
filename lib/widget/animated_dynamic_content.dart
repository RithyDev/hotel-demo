import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppAnimatedDynamicContent extends StatelessWidget {
  final Widget? child;
  final String? keyState;

  const AppAnimatedDynamicContent({super.key, this.child, this.keyState});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 140),
      child: Container(
        key: ValueKey<String>(keyState ?? ''),
        child: child?.animate(
          delay: const Duration(milliseconds: 140)
        ).fade(),
      ),
    );
  }
}
