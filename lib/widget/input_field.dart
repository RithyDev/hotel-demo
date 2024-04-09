import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/widget/animated_dynamic_content.dart';
import 'package:hotel_app/widget/styles.dart';

class AppInputField extends StatefulWidget {
  final String? hint;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final String? errorMessage;
  final bool? obscureText;
  final Widget? icon;

  const AppInputField(
      {super.key,
      this.hint,
      this.placeholder,
      this.onChanged,
      this.maxLines,
      this.errorMessage, this.obscureText, this.icon});

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {

  bool showInputObscureText = false;
  
  @override
  void initState() {
    super.initState();
    if (widget.obscureText == true) {
      showInputObscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.hint ?? ''),
        const SizedBox(height: 8),
        _renderInputBox(context),
        _renderErrorMessage(context)
      ],
    );
  }

  Widget _renderErrorMessage(BuildContext context) {
    final errorMessage = widget.errorMessage;

    final child = errorMessage != null
        ? _renderErrorText(errorMessage)
        : const SizedBox();

    return AppAnimatedDynamicContent(
      keyState: '${widget.errorMessage}',
      child: child,
    );
  }

  Widget _renderErrorText(String? errorMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        errorMessage ?? '', 
        style: const TextStyle(color: Colors.red)
      ),
    );
  }

  Widget _renderInputBox(BuildContext context) {
    return TextField(
      maxLines: 1,
      onChanged: widget.onChanged,
      obscureText: showInputObscureText,
      decoration: outlineInputField(
        context, isError: 
        widget.errorMessage != null,
        icon: widget.icon,
        suffixIcon: _renderObscureTextToggle(),
      ).copyWith(hintText: widget.placeholder)
    );
  }

  Widget? _renderObscureTextToggle() {
    final child = switch(widget.obscureText) {
      true => GestureDetector(
        onTap: () => toggleObscureText(),
        child: Icon(
          showInputObscureText ? Icons.remove_red_eye_outlined : Icons.remove_red_eye
        ),
      ),
      _ => const SizedBox()
    };
    return AppAnimatedDynamicContent(
      keyState: '$showInputObscureText',
      child: child,
    );
  }

  void toggleObscureText() {
    final newState =!showInputObscureText;
    setState(() {
      showInputObscureText = newState;
    });
  }
}
