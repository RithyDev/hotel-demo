import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/booking/booking_page.dart';
import 'package:hotel_app/feature/home/hotel/detail/hotel_detail_header.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_common_facilities.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_hotel_location.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_hotel_overview.dart';
import 'package:hotel_app/feature/home/hotel/detail/item_hotel_review.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/common_widget.dart';

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
    return Stack(
      children: [
        _renderMainContainer(context),
        _renderFooterBackground(),
        _renderFooterView(),
      ],
    );
  }

  Widget _renderMainContainer(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        _renderAppbar(context),
        _renderCommonFacillitiesInfo(),
        _renderOverviewContent(),
        _renderLocationInfo(),
        ..._reviewSessionSliverBoxs(),
        SliverToBoxAdapter(
          child: space(height: 120),
        ),
      ],
    );
  }

  Widget _renderFooterBackground() {
    var color = Colors.white;
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  color,
                  color,
                  color.withOpacity(0.4),
                  color.withOpacity(0.0)
                ], // White to transparent
              ),
            )));
  }

  Widget _renderFooterView() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('\$'),
                    Text(
                      "${model?.price}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                _renderBookingNowButton()
              ],
            ),
          ),
        ));
  }

  Widget _renderBookingNowButton() {
    return Expanded(
        child: appRoundedButton(context,
            title: null,
            onPressed: () => navigateToBooking(),
            child: const Text(
              'Booking Now',
              style: TextStyle(color: Colors.white),
            )));
  }

  void navigateToBooking() {
    
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HotelBookingPage(hotel: model!,)));
  }

  SliverToBoxAdapter _renderLocationInfo() {
    return SliverToBoxAdapter(
      child: LocationInfo(model: model),
    );
  }

  List<Widget> _reviewSessionSliverBoxs() {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Reviews'),
              TextButton(onPressed: () {}, child: const Text('See all'))
            ],
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: 2, (context, index) => const ItemHotelReview())),
    ];
  }

  SliverToBoxAdapter _renderOverviewContent() {
    return const SliverToBoxAdapter(
      key: ValueKey('section_overview'),
      child: HotelOverview(),
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
    expandedHeight = size.width * 0.8;
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 56,
      expandedHeight: expandedHeight,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      forceMaterialTransparency: false,
      actions: [_renderToolbar(size)],
      flexibleSpace: DetailHeaderContent(model: model),
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

    return Card(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        splashColor: Colors.red.withOpacity(0.2),
        onTap: () => setState(() {
          model?.isSavedFavite = !isFavorited;
        }),
        child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(iconData, color: color, size: 32)
                .animate(key: ValueKey('item_favorit_$isFavorited'))
                .scale()),
      ),
    );
  }

  Widget _renderBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
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

  TextStyle get _appbarTextStyle => const TextStyle(color: Colors.white);
}
