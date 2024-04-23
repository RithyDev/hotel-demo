import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/booking/checkout/promo_code_model.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/widget/common_widget.dart';

class ItemPromoCode extends StatelessWidget {
  final PromoCode model;
  final bool isSelected;
  final VoidCallback onTap;
  const ItemPromoCode(
      {super.key, required this.model, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.blue;
    Color selectedColor = isSelected ? activeColor : Colors.grey.withOpacity(0.2);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        clipBehavior: Clip.antiAlias,       
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blue.withOpacity(0.1),  
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(width: isSelected? 2 : 1, color: selectedColor),
                borderRadius: BorderRadius.circular(18)),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageSource.icPromoCode,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
                ),
                space(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [_renderTitle(), space(height: 4),_renderSubtitle()],
                  ),
                ),
                isSelected
                    ? Icon(Icons.check_rounded, color: activeColor, size: 20,)
                    : space()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderSubtitle() => Row(
        children: [
          Opacity(
              opacity: 0.6,
              child: Text(
                model.subtitle,
                style: _subtitleStyle,
              )),
          space(width: 4),
          Text(
            'See Detail',
            style: _subtitleStyle.copyWith(
                fontWeight: FontWeight.w600, color: Colors.blue),
          )
        ],
      );

  Text _renderTitle() => Text(
        model.title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      );

  TextStyle get _subtitleStyle => const TextStyle(fontSize: 12);
}
