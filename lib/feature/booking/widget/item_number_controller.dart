
import 'package:flutter/material.dart';
import 'package:hotel_app/widget/common_widget.dart';

class ItemNumberController extends StatelessWidget {
  final String title;
  final String subtitle;
  final int? value;
  final bool? showLineDivider;

  const ItemNumberController(
      {super.key, required this.title, required this.subtitle, this.value, this.showLineDivider});

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
        showLineDivider ?? true ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Divider(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ) : space()
      ],
    );
  }

  Row _renderNumberController(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.remove_circle_outlined,
          size: 32,
          color: Colors.grey.withOpacity(0.4),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${value ?? 0}'),
        ),
        Icon(Icons.add_circle_outlined,
            color: Theme.of(context).primaryColor, size: 32)
      ],
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
