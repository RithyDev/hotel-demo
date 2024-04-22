import 'package:flutter/material.dart';
import 'package:hotel_app/widget/common_widget.dart';

class AppToolbar extends StatelessWidget {
  final bool? enabledBackPressed;
  final String? title;

  const AppToolbar({super.key, this.enabledBackPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (enabledBackPressed ?? true) ? _renderBackButton(context) : space(),
          _renderTextTitle(),
          space(width: 42)
        ],
      ),
    );
  }

  Widget _renderTextTitle() {
    return Text(
      title ?? '',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _renderBackButton(BuildContext context) {
    double size = 42;
    return Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(size / 2)),
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(size/2)
            ),
            child: SizedBox(
                width: size, height: size, child: const Icon(Icons.arrow_back)),
          ),
        ));
  }
}
