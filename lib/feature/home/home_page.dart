import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/home/page_tab_behavior.dart';
import 'package:hotel_app/feature/home/widget/home_headline.dart';
import 'package:hotel_app/feature/home/widget/home_toolbar.dart';
import 'package:hotel_app/feature/home/widget/item_hotel_nearby.dart';
import 'package:hotel_app/feature/home/widget/item_suggest_hotel.dart';

class HomePage extends StatelessWidget implements TabPageBehavior {

  const HomePage({super.key});

  @override
  void onReady() {
    
  }

  @override
  Widget get page => this;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderHeader(context),
          Expanded(
            child: _mainScrollContainer(context),
          )
        ],
      ),
    );
    
  }

  Widget _mainScrollContainer(BuildContext context) {
    
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        _renderSliverBox(
          child: _renderHeadlineInfo(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _renderRecommendedHotelsContainer(),
        ])),
        _renderSliverBox(
          child: _renderSuggestedHotels(context).animate(
            delay: const Duration(seconds: 1)
          ).slideX(
            begin: 1,
            end: 0.0
          ),
        ),
        _renderSliverBox(child: _nearByHotelTitle(context)),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => ItemHotelNearby(),
        ))
      ],
    ).animate().fade();
  }

  Widget _nearByHotelTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nearby Hotels',
            style: _listHeadLineStyle,
          ),
          TextButton(onPressed: () {}, child: const Text('See All')),
        ],
      ),
    );
  }

  Widget _renderRecommendedHotelsContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recommended Hotel🔥',
            style: _listHeadLineStyle,
          ),
          TextButton(onPressed: () => {}, child: const Text('See all')),
        ],
      ),
    );
  }

  Widget _renderSuggestedHotels(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWith = screenWidth * 0.7;
    double itemHight = itemWith * 1.22;

    return SizedBox(
      height: itemHight,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        key: const ValueKey('list_builder_suggessted_hotels'),
        itemCount: 4,
        itemBuilder: (context, index) =>
            SizedBox(width: itemWith, child: const ItemSuggestedHotel()),
      ),
    );
  }

  SliverToBoxAdapter _renderSliverBox({required Widget child}) =>
      SliverToBoxAdapter(child: child);

  Widget _renderHeader(BuildContext context) {
    return const HomeToolbar();
  }

  Widget _renderHeadlineInfo() => const HomePageHeadlineInfo();

  TextStyle get _listHeadLineStyle =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
}
