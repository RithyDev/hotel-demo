import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/resource/image_resource.dart';

class ItemSuggestedHotel extends StatefulWidget {
  const ItemSuggestedHotel({super.key});

  @override
  State<ItemSuggestedHotel> createState() => _ItemSuggestedHotelState();
}

class _ItemSuggestedHotelState extends State<ItemSuggestedHotel> {
  bool isFavoritePlace = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            _renderHotelPicture(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _priceInfoBuilder(context),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _renderFavoriteButton(),
                )
              ],
            ),
            _renderHotelInfo(context)
          ],
        ),
      ),
    );
  }

  Widget _renderFavoriteButton() {
    var icon = isFavoritePlace ? Icons.favorite : Icons.favorite_outline;
    Color color = isFavoritePlace ? Colors.red : Colors.white;
    var child = Icon(icon, color: color);
    var animatedChild = child
        .animate(key: ValueKey<bool>(isFavoritePlace))
        .scale(
            duration: const Duration(milliseconds: 240),
            begin: const Offset(0.5, 0.5),
            end: const Offset(1, 1));

    return GestureDetector(
        onTap: () {
          setState(() {
            isFavoritePlace = !isFavoritePlace;
          });
        },
        child: animatedChild);
  }

  Padding _priceInfoBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 0,
        color: Colors.black87.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$29.99',
                style: priceTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '/Day',
                style: priceTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderHotelPicture() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        ImageSource.imgOnboard1,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _renderHotelInfo(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: _renderHotelContainerCard(context),
      ),
    );
  }

  Card _renderHotelContainerCard(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _renderHotelName(),
            _renderLocationInfo(),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _rowInfoBuilder(context, 'Beds', Icons.bed_outlined),
                  _rowInfoBuilder(context, 'wifi', Icons.wifi_outlined),
                  _rowInfoBuilder(context, 'pool', Icons.pool_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowInfoBuilder(BuildContext context, String title, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 4),
        Text(title)
      ],
    );
  }

  Widget _renderHotelName() => const Text(
        'Hotel name',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );

  Widget _renderLocationInfo() {
    return const Opacity(
      opacity: 0.5,
      child: Row(
        children: [
          Icon(Icons.location_on, size: 16),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              'location info run random text to max width is awesome',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get priceTextStyle =>
      const TextStyle(fontSize: 12, color: Colors.white);
}
