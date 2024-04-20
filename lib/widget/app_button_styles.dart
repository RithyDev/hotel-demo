import 'package:flutter/material.dart';

Widget appRoundedButton(BuildContext context,
    {String? title, required VoidCallback? onPressed, Widget? child}) {
  final displayChild = child ??
      Text(
        title ?? '',
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      );
  return SizedBox(
    height: 55,
    child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            disabledBackgroundColor: Theme.of(context).primaryColorLight),
        child: displayChild),
  );
}

Future<dynamic> showMessageDialog(BuildContext context,
    {String? title, required String message}) {
  var dialogContent =
      AlertDialog(title: Text(title ?? ''), content: Text(message));
  return showDialog(context: context, builder: (context) => dialogContent);
}
