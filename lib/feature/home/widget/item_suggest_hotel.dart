import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/route/app_route.dart';
import 'package:hotel_app/widget/app_network_image.dart';

class ItemSuggestedHotel extends StatefulWidget {
  final HotelModel model;
  final Function()? onPressed;
  const ItemSuggestedHotel(
      {super.key, required this.model, required this.onPressed});

  @override
  State<ItemSuggestedHotel> createState() => _ItemSuggestedHotelState();
}

class _ItemSuggestedHotelState extends State<ItemSuggestedHotel> {
  
  HotelModel get model => widget.model;
  bool get isFavoritePlace => model.isSavedFavite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () { goToHotelPageDetail(context); },
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
            begin: const Offset(1.2, 1.2),
            end: const Offset(1, 1));

    return GestureDetector(
        onTap: () {
          model.isSavedFavite = !isFavoritePlace;
          setState(() {
            // model.isSavedFavite=
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
                '\$${model.price}',
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
      child: AppNetworkImage(
        source: model.thumnail,
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
                  _rowInfoBuilder(
                      context, '${model.bed} Beds', Icons.bed_outlined),
                  _rowInfoBuilder(context, 'wifi',
                      model.hasWifi ? Icons.wifi_outlined : Icons.wifi_off),
                  _rowInfoBuilder(context, model.hasPool ? 'pool' : 'No',
                      Icons.pool_outlined),
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

  Widget _renderHotelName() => Text(
        model.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );

  Widget _renderLocationInfo() {
    return Opacity(
      opacity: 0.5,
      child: Row(
        children: [
          const Icon(Icons.location_on, size: 16),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              model.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get priceTextStyle =>
      const TextStyle(fontSize: 12, color: Colors.white);

  void goToHotelPageDetail(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed(RouteName.hotelPageDetail, arguments: model);
    setState(() {
    });
  }
}
