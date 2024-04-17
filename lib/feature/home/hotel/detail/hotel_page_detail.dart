import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_common_facilities.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_hotel_overview.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';

class HotelPageDetail extends StatefulWidget {
  const HotelPageDetail({super.key});

  @override
  State<HotelPageDetail> createState() => _HotelPageDetailState();
}

class _HotelPageDetailState extends State<HotelPageDetail> {
  HotelModel? model;
  final ScrollController _scrollController = ScrollController();
  Color get actionColor => isAppbarCollapsed ? Colors.black : Colors.white;
  bool isAppbarCollapsed = false;
  int selectedSliderPage = 0;
  double expandedHeight = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      var isCollaped = _scrollController.hasClients &&
          _scrollController.offset > (expandedHeight - kToolbarHeight);
      if (isCollaped != isAppbarCollapsed) {
        setState(() {
          isAppbarCollapsed = isCollaped;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if ((args != null && model == null) && args is HotelModel) {
      model = args;
    }

    return Scaffold(
      body: _renderMainScrollView(context),
    );
  }

  Widget _renderMainScrollView(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [_renderAppbar(context), 
      _renderCommonFacillitiesInfo(),
      SliverToBoxAdapter(
        child: HotelOverview(),
      )],
    );
  }

  Widget _renderCommonFacillitiesInfo() {
    return const SliverToBoxAdapter(
      child: HotelCommonFacilities(),
    );
  }

  

  Widget _renderAppbar(
    BuildContext context,
  ) {
    var size = MediaQuery.of(context).size;
    var r = const Radius.circular(20);
    expandedHeight = size.width * 0.8;
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 56,
      expandedHeight: expandedHeight,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      forceMaterialTransparency: false,
      actions: [_renderToolbar(size)],
      flexibleSpace: Container(
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
      ),
    );
  }

  Widget _renderToolbar(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _renderBackButton(),
          _toobarTitle(),
          _renderFavoriteButton()
        ],
      ),
    );
  }

  Text _toobarTitle() {
    return Text(
      'Detail Hotel',
      style: _appbarTextStyle.copyWith(
          fontWeight: FontWeight.bold, fontSize: 16, color: actionColor),
    );
  }

  Widget _renderFavoriteButton() {
    var isFavorited = model?.isSavedFavite ?? false;
    var color = isFavorited ? Colors.red : actionColor;
    var iconData =
        isFavorited ? Icons.favorite_rounded : Icons.favorite_outline;
    return SizedBox(
        width: 40, height: 40, child: Icon(iconData, color: color, size: 32));
  }

  Widget _renderBackButton() {
    return GestureDetector(
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: actionColor),
              borderRadius: BorderRadius.circular(20)),
          child: Icon(
            Icons.arrow_back,
            color: actionColor,
          )).animate(key: ValueKey('arrow_back_$isAppbarCollapsed')).fade(),
    );
  }

  Widget _renderHotelNameAndAddress() {
    return Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Column(
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
                  color: Colors.white,
                ),
                Text(model?.address ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: _appbarTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ));
  }

  Widget _renderSlideIndicator() {
    int count = 3;
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
    var isSelected = index == selectedSliderPage;

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
      urls.add(model!.thumnail);
    }
    return PageView(
      physics: null,
      onPageChanged: (index) => {
        setState(() {
          selectedSliderPage = index;
        })
      },
      children: urls.map((url) => _imageSlider(url)).toList(),
    );
  }

  Widget _imageSlider(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }

  TextStyle get _appbarTextStyle => const TextStyle(color: Colors.white);
}
