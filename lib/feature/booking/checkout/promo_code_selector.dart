import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_app/feature/booking/checkout/item_promo_code.dart';
import 'package:hotel_app/feature/booking/checkout/promo_code_model.dart';
import 'package:hotel_app/widget/app_button_styles.dart';

class PromoCodeSelectorPage extends StatefulWidget {
  final List<PromoCode> promoCodes;

  const PromoCodeSelectorPage({super.key, required this.promoCodes});

  @override
  State<PromoCodeSelectorPage> createState() => _PromoCodeSelectorPageState();
}

class _PromoCodeSelectorPageState extends State<PromoCodeSelectorPage> {

  String? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.promoCodes.firstOrNull?.id;
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_renderTitle(), _renderPromoCodeList()],
        ),
        _renderSelectButton(context)
      ],
    );
  }

  Widget _renderPromoCodeList() {
    Widget list = ListView.builder(
        itemCount: widget.promoCodes.length,
        itemBuilder: (context, index) => _renderListItem(index));
    return Expanded(child: list);
  }

  ItemPromoCode _renderListItem(int index) {
    var model = widget.promoCodes[index];
    return ItemPromoCode(isSelected: model.id == _selectedId, model: model, onTap: () {
      setState(() {
        _selectedId = model.id;
      });
    });
  }

  Widget _renderSelectButton(BuildContext context) {
    return Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: SafeArea(
            child:
                appRoundedButton(context, onPressed: () {}, title: 'Select')));
  }

  Widget _renderTitle() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Select Promo',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
