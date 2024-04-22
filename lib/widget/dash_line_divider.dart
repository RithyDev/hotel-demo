import 'package:flutter/material.dart';

class DashedLineDivider extends StatelessWidget {
  final Color? dashColor;
  const DashedLineDivider({super.key, this.dashColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1, // Height of the dashed line
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {

  final Color? color;
  DashedLinePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color?? Colors.grey.withOpacity(0.4) // Color of the dashed line
      ..strokeWidth = 1 // Thickness of the dashed line
      ..strokeCap = StrokeCap.square;

    // Define the length of each dash and space
    const dashWidth = 5;
    const dashSpace = 3;

    // Draw the dashed line
    var startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}