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
  final Widget? iconOnFocused;

  const AppInputField(
      {super.key,
      this.hint,
      this.placeholder,
      this.onChanged,
      this.maxLines,
      this.errorMessage,
      this.obscureText,
      this.icon,
      this.iconOnFocused});

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  final FocusNode _focusNode = FocusNode();
  bool hasFocused = false;
  bool hasText = false;

  bool showInputObscureText = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.obscureText == true) {
      showInputObscureText = true;
    }

    _focusNode.addListener(() {
      setState(() {
        hasFocused = _focusNode.hasFocus;
      });
    });
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
      child:
          Text(errorMessage ?? '', style: const TextStyle(color: Colors.red)),
    );
  }

  Widget _renderInputBox(BuildContext context) {
    return TextField(
        maxLines: 1,
        focusNode: _focusNode,
        onChanged: (value) => invokeOnChange(value),
        obscureText: showInputObscureText,
        decoration: outlineInputField(
          context,
          isError: widget.errorMessage != null,
          icon: hasFocused || hasText
              ? (widget.iconOnFocused ?? widget.icon)
              : widget.icon,
          suffixIcon: _renderObscureTextToggle(),
        ).copyWith(hintText: widget.placeholder));
  }

  void invokeOnChange(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
    setState(() {
      hasText = value.isNotEmpty;
    });
  }

  Widget? _renderObscureTextToggle() {
    final child = switch (widget.obscureText) {
      true => Icon(
        key: ValueKey<bool>(showInputObscureText),
        showInputObscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        color: Colors.grey,
      ),
      _ => const SizedBox()
    };

    return GestureDetector(
      onTap: () => toggleObscureText(),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 140),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: child,
      ),
    );
  }

  void toggleObscureText() {
    final newState = !showInputObscureText;
    setState(() {
      showInputObscureText = newState;
    });
  }
}
