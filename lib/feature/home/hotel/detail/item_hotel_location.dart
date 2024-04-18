import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/widget/app_network_image.dart';
import 'package:hotel_app/widget/common_widget.dart';

class LocationInfo extends StatelessWidget {
  final HotelModel? model;
  const LocationInfo({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Location'),
              TextButton(onPressed: () {}, child: const Text('View Detail'))
            ],
          ),
          _renderMapImageSnapshot()
        ],
      ),
    );
  }

  Widget _renderMapImageSnapshot() {
    double raduis = 20;
    double padding = 4;
    var source = 'https://snapshot.apple-mapkit.com/api/v1/snapshot?center=San%20Diego,%20California&scale=2&teamId=J7V35W7ES8&keyId=VKGGG3L5BX&signature=Cb9io7vYYAKK-VRkw7LHGfMUsfUSEIMMZHcl8TryR7JiAYimt6eZliS7vVR0xygB5EWhysfKnIEBImbNUF1imA';
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(raduis - padding),
            child:  AppNetworkImage(
              source: source,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: Colors.blue,
                ),
                space(width: 6),
                Expanded(
                    child: Text(
                  model?.address ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
