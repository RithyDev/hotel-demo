import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCheckBox extends StatefulWidget {
  final ValueChanged<bool?> onChanged;
  final String? title;
  final Widget? customChild;
  const AppCheckBox(
      {super.key, required this.onChanged, this.title, this.customChild});

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toogleChanged(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _renderCheckbox(),
          Expanded(
            child: widget.customChild != null
                ? widget.customChild!
                : _renderLabel(),
          )
        ],
      ),
    );
  }

  Widget _renderLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        widget.title ?? '',
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _renderCheckbox() {
    return Checkbox(
        activeColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: Colors.grey),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: isChecked,
        onChanged: _onCheckedChange);
  }

  void _onCheckedChange(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
    widget.onChanged(value ?? false);
  }

  void _toogleChanged() {
    bool newState = !isChecked;
    _onCheckedChange(newState);
  }
}
