import 'package:flutter/material.dart';

Widget appRoundedButton(BuildContext context,
    {required String title, required VoidCallback? onPressed, Widget? child}) {
  final displayChild = child?? Text(title, style: const TextStyle(color: Colors.white, fontSize: 16),);
  return SizedBox(
    height: 55,
    child: TextButton(onPressed: onPressed, style: TextButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      disabledBackgroundColor: Theme.of(context).primaryColorLight      
    ),child: displayChild),
  );
}
