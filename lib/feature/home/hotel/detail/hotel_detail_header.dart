import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/widget/app_network_image.dart';
import 'package:hotel_app/widget/common_widget.dart';

class DetailHeaderContent extends StatefulWidget {
  final HotelModel? model;
  const DetailHeaderContent({super.key, required this.model});

  @override
  State<DetailHeaderContent> createState() => _DetailHeaderContentState();
}

class _DetailHeaderContentState extends State<DetailHeaderContent> {
  int _pageSelected = 0;
  HotelModel? get model => widget.model;

  @override
  Widget build(BuildContext context) {
    var r = const Radius.circular(20);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: r, bottomRight: r)),
      child: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [_renderImageSliderBox(), _renderHotelNameAndAddress()],
        ),
      ),
    );
  }

  Widget _renderImageSliderBox() {
    return SizedBox(
      width: double.infinity,
      child: _renderImageSlider(),
    );
  }

  Widget _renderImageSlider() {
    List<String> urls = [];
    if (model != null) {
      urls.add(model!.thumnail);
      urls.addAll(model?.images ?? []);
    }
    return PageView(
      physics: null,
      onPageChanged: (index) => {
        setState(() {
          _pageSelected = index;
        })
      },
      children: urls.map((url) => _imageSlider(url)).toList(),
    );
  }

  Widget _imageSlider(String url) {
    return AppNetworkImage(
      source: url,
      fit: BoxFit.cover,
    );
  }

  Widget _renderHotelNameAndAddress() {
    return Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _renderSlideIndicator(),
                Text(model?.name ?? '',
                    style: _appbarTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.white,
                    ),
                    space(width: 4),
                    Text(model?.address ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: _appbarTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Widget _renderSlideIndicator() {
    int count = 1 + (model?.images.length ?? 0);

    List<int> indicator = [];
    for (var i = 0; i < count; i++) {
      indicator.add(i);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicator.map((index) => _pageIndicator(index)).toList(),
    );
  }

  Widget _pageIndicator(int index) {
    var isSelected = index == _pageSelected;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AnimatedContainer(
        width: isSelected ? 24 : 6,
        height: 6,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(isSelected ? 1 : 0.4),
            borderRadius: BorderRadius.circular(6)),
        duration: const Duration(milliseconds: 240),
      ),
    );
  }

  TextStyle get _appbarTextStyle => const TextStyle(color: Colors.white);
}
