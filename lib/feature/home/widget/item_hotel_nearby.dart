import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/route/app_route.dart';

class ItemHotelNearby extends StatefulWidget {
  final HotelModel model;
  const ItemHotelNearby({super.key, required this.model});

  @override
  State<ItemHotelNearby> createState() => _ItemHotelNearbyState();
}

class _ItemHotelNearbyState extends State<ItemHotelNearby> {
  double? imageSize;

  HotelModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _gotoPageDetial(), child: _builderItem(context));
  }

  Widget _builderItem(BuildContext context) {
    if (imageSize == null) {
      WidgetsBinding.instance.endOfFrame.then((value) {
        if (mounted && imageSize != null) {
          setState(() {});
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: (imageSize ?? 0) + 12, top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColorDark),
                  ),
                  Opacity(
                      opacity: 0.5,
                      child: Text(
                        model.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 12),
                  _buildPriceAndRatingInfo(context)
                ],
              ),
            ),
            _buildThumnail()
          ],
        ),
      ),
    );
  }

  Widget _buildThumnail() {
    return Positioned(
        top: 0,
        bottom: 0,
        child: LayoutBuilder(
          builder: (context, constraints) {
            imageSize = constraints.maxHeight;
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                model.thumnail,
                fit: BoxFit.cover,
                width: imageSize!,
                height: imageSize!,
              ),
            );
          },
        ));
  }

  Widget _buildPriceAndRatingInfo(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${model.price}',
          style: _priceTextStyle.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '/Day',
          style: _priceTextStyle,
        ),
        const SizedBox(width: 16),
        const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
        Text(
          '${model.rate}',
          style: _priceTextStyle.copyWith(
              color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 2),
        Opacity(
            opacity: 0.5,
            child: Text(
              '(${model.totalReview} review)',
              style: _priceTextStyle,
            ))
      ],
    );
  }

  TextStyle get _priceTextStyle => const TextStyle(fontSize: 12);

  void _gotoPageDetial() {
    Navigator.of(context)
        .pushNamed(RouteName.hotelPageDetail, arguments: model);
  }
}
