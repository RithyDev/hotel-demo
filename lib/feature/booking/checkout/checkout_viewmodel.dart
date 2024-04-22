import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/checkout/promo_code_model.dart';

class CheckoutViewModel extends ChangeNotifier {
  
  final List<PromoCode> promoCodes = [
    PromoCode(id: '0001', title: '35% Cashback', subtitle: 'Expired in 2 days'),
    PromoCode(id: '0002', title: '18% Discount', subtitle: 'Expired in 1 day'),
    PromoCode(id: '0003', title: '15% Discount', subtitle: 'Expired in 1 day')
  ];
}