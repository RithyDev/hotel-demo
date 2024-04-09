import 'package:flutter/material.dart';

TextStyle get largetText =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);

TextStyle get submitButtonTextStyle =>
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

InputBorder inputOutlineBorder(BuildContext context, {Color? borderColor}) =>
    OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide:
            BorderSide(color: borderColor ?? Colors.grey.withOpacity(0.2)));

InputDecoration outlineInputField(BuildContext context,
    {bool isError = false, Widget? icon, Widget? suffixIcon}) {
  final enabledColor = isError ? Colors.red.withOpacity(0.2) : null;
  final focusedBorder = (isError ? Colors.red : Colors.blue).withOpacity(0.2);
  return InputDecoration(
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      enabledBorder: inputOutlineBorder(context, borderColor: enabledColor),
      focusedBorder: inputOutlineBorder(context, borderColor: focusedBorder));
}
