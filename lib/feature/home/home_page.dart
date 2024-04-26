import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/home/home_viewmodel.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/feature/home/page_tab_behavior.dart';
import 'package:hotel_app/feature/home/widget/home_headline.dart';
import 'package:hotel_app/feature/home/widget/home_toolbar.dart';
import 'package:hotel_app/feature/home/widget/item_hotel_nearby.dart';
import 'package:hotel_app/feature/home/widget/item_suggest_hotel.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/route/app_route.dart';
import 'package:hotel_app/widget/dialog_utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget implements TabPageBehavior {
  const HomePage({super.key});

  @override
  void onReady() {}

  @override
  Widget get page => this;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderHeader(context),
          Expanded(
            child: _renderOnStateChange(context, viewModel),
          )
        ],
      ),
    );
  }

  Widget _renderOnStateChange(BuildContext context, HomeViewModel viewModel) {
    var state = viewModel.data;
    return switch (state?.state) {
      AsyncState.loading => appBlockLoading('Please wait'),
      AsyncState.success => _mainScrollContainer(context, viewModel),
      _ => const SizedBox()
    };
  }

  Widget _mainScrollContainer(BuildContext context, HomeViewModel viewModel) {
    Widget child = CustomScrollView(
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
        _renderSliverBox(child: LayoutBuilder(builder: (context, box) {
          return _renderSuggestedHotels(context, viewModel,
              parentWidth: box.maxWidth);
        })),
        _renderSliverBox(child: _nearByHotelTitle(context)),
        _renderNearbyHotel(context, viewModel)
      ],
    ).animate().fade();
    return child;
  }

  SliverList _renderNearbyHotel(BuildContext context, HomeViewModel viewModel) {
    var items = viewModel.nearBy;
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: items.length,
      (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ItemHotelNearby(model: items[index]),
      ),
    ));
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

  Widget _renderSuggestedHotels(BuildContext context, HomeViewModel viewModel,
      {double? parentWidth}) {
    double screenWidth = parentWidth ?? MediaQuery.of(context).size.width;
    double itemWith = screenWidth * 0.7;
    double itemHight = itemWith * 1.22;
    var items = viewModel.recommended;

    return SizedBox(
      height: itemHight,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        key: const ValueKey('list_builder_suggessted_hotels'),
        itemCount: items.length,
        itemBuilder: (context, index) => SizedBox(
            width: itemWith,
            child: ItemSuggestedHotel(
                model: items[index],
                onPressed: () => goToHotelPageDetail(context, items[index]))),
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

  void goToHotelPageDetail(BuildContext context, HotelModel model) {
    Navigator.of(context)
        .pushNamed(RouteName.hotelPageDetail, arguments: model);
  }
}


@RoutePage()
class TabHomeScreen extends StatelessWidget {
  
  const TabHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}