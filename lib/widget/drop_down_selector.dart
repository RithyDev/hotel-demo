import 'package:flutter/material.dart';
import 'package:hotel_app/widget/animated_dynamic_content.dart';
import 'package:hotel_app/widget/common_widget.dart';

class DropDownSelector extends StatelessWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final String? errorMessage;
  final Widget? leadingIcon;
  final VoidCallback onPressed;

  const DropDownSelector(
      {super.key,
      this.label,
      this.placeholder,
      this.value,
      this.errorMessage,
      this.leadingIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool isError = errorMessage != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label != null ? _renderLabel() : space(),
        space(height: label != null ? 12 : 0),
        _renderInputBox(context),
        AppAnimatedDynamicContent(
          keyState: '$errorMessage',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              space(height: isError ? 8 : 0),
              isError ? _renderErrorText() : space(),
            ],
          ),
        )
      ],
    );
  }

  Text _renderErrorText() => Text(
        errorMessage!,
        style: const TextStyle(
            color: Colors.redAccent, fontWeight: FontWeight.w500),
      );

  Widget _renderLabel() => Text(label!,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16));

  Widget _renderInputBox(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.withOpacity(0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: _inputDecor(),
            child: Row(
              children: [
                leadingIcon ?? space(),
                _renderValueHolder(context),
                _renderDropdowIcon()
              ],
            )),
      ),
    );
  }

  BoxDecoration _inputDecor() {
    return BoxDecoration(
        
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(20));
  }

  Widget _renderDropdowIcon() {
    return const Opacity(
      opacity: 0.4,
      child: Icon(Icons.keyboard_arrow_down_rounded, size: 32),
    );
  }

  Widget _renderValueHolder(BuildContext context) {
    var color = Theme.of(context).textTheme.bodyMedium?.color;
    double opacity = value != null ? 1 : 0.5;
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(value ?? placeholder ?? '',
          style: TextStyle(color: color?.withOpacity(opacity)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
    ));
  }
}
