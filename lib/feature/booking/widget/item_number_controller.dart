import 'package:flutter/material.dart';
import 'package:hotel_app/widget/common_widget.dart';

class ItemNumberController extends StatelessWidget {
  final String title;
  final String subtitle;
  final int? value;
  final bool? showLineDivider;
  final Function(int mode)? onActionPressed;

  const ItemNumberController(
      {super.key,
      required this.title,
      required this.subtitle,
      this.value,
      this.showLineDivider,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              _renderTitleAndSubtitle(),
              _renderNumberController(context)
            ],
          ),
        ),
        showLineDivider ?? true
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
              )
            : space()
      ],
    );
  }

  Row _renderNumberController(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _renderActionButton(
            color: Colors.grey.withOpacity(0.1),
            icon: const Icon(Icons.remove),
            onPressed: _onRemoveClicked),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${value ?? 0}'),
        ),
        _renderActionButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _onAddClicked())
      ],
    );
  }

  void _onRemoveClicked() {
    if (onActionPressed != null) {
      if ((value??0) > 0) {
        onActionPressed!(-1);
      }      
    }
  }

  void _onAddClicked() {
    if (onActionPressed != null) {
      onActionPressed!(1);      
    }
  }

  Widget _renderActionButton(
      {required Widget icon, required VoidCallback onPressed, Color? color}) {
    return SizedBox(
      width: 34,
      height: 34,
      child: Card(
        color: color,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: InkWell(onTap: onPressed, child: icon),
      ),
    );
  }

  Widget _renderTitleAndSubtitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          space(height: 6),
          Opacity(
              opacity: 0.6,
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}
