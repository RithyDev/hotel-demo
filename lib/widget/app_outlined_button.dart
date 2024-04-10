import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => {},
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.withOpacity(0.2))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(color: Colors.black,fontSize: 16),),
            ],
          ),
        ));
  }
}
