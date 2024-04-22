import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/booking/checkout/checkout_viewmodel.dart';
import 'package:hotel_app/feature/booking/checkout/promo_code_selector.dart';
import 'package:hotel_app/feature/booking/model/booking_info.dart';
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart';
import 'package:hotel_app/feature/home/widget/item_hotel_nearby.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/app_toolbar.dart';
import 'package:hotel_app/widget/common_widget.dart';
import 'package:hotel_app/widget/dash_line_divider.dart';
import 'package:hotel_app/widget/date_time_utils.dart';
import 'package:provider/provider.dart';

class CheckoutRoomPage extends StatefulWidget {
  final HotelModel? hotelInfo;
  final BookingInfo info;
  const CheckoutRoomPage({super.key, this.hotelInfo, required this.info});

  @override
  State<CheckoutRoomPage> createState() => _CheckoutRoomPageState();
}

class _CheckoutRoomPageState extends State<CheckoutRoomPage> {
  late CheckoutViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CheckoutViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var content = Scaffold(
      body: SafeArea(
        child: Column(
          children: [_renderToolbar(), _renderMainContainer()],
        ),
      ),
    );

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CheckoutViewModel>(
          builder: (context, value, child) => content),
    );
  }

  Widget _renderMainContainer() {
    return Expanded(
        child: Stack(
      children: [
        _renderScrollableContent(),
        _renderBottomButtonBackground(),
        _renderPaymentButton()
      ],
    ));
  }

  Widget _renderBottomButtonBackground() {
    Color color = Theme.of(context).scaffoldBackgroundColor;
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
          )),
    );
  }

  Widget _renderPaymentButton() {
    return Positioned(
        bottom: 16,
        left: 24,
        right: 24,
        child: appRoundedButton(context,
            onPressed: () {},
            child: Text('Select Payment',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16))));
  }

  CustomScrollView _renderScrollableContent() {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        _renderHotelInfo(),
        _renderBookingListedInfo(),
        _renderPromoCode()
      ],
    );
  }

  AppToolbar _renderToolbar() => const AppToolbar(title: 'Checkout');

  SliverToBoxAdapter _renderHotelInfo() {
    HotelModel? model = widget.hotelInfo;
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: (model != null ? ItemHotelNearby(model: model) : space()),
    ));
  }

  SliverToBoxAdapter _renderBookingListedInfo() {
    return SliverToBoxAdapter(
      child: _renderListedInfo(),
    );
  }

  Widget _renderPromoCode() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Promo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            space(height: 6),
            _renderPromoCodeButton()
          ],
        ),
      ),
    );
  }

  Widget _renderPromoCodeButton() {
    return Card(
      elevation: 0,
      color: Colors.grey.withOpacity(0.1),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: _selectPromoCode,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: SvgPicture.asset(
                    ImageSource.icPromoCode,
                    width: 22,
                    height: 22,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Select',
                  style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Icon(Icons.keyboard_arrow_right_rounded, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderListedInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _renderListTitle('Your booking'),
              space(height: 8),
              ..._listedInfo()
            ],
          )),
    );
  }

  Widget _renderListTitle(String title) {
    return Opacity(
      opacity: 0.6,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _listedInfo() {
    return [
      _renderListedItemInfo(
          icon: Icons.calendar_month_outlined,
          title: 'Date',
          value: widget.info.date.formatToString()),
      _renderListedItemInfo(
          icon: Icons.person_outline,
          title: 'Guest',
          value: widget.info.guestInfo),
      _renderListedItemInfo(
          icon: Icons.home_work_outlined,
          title: 'Room type',
          value: widget.info.roomType),
      _renderListedItemInfo(
          icon: Icons.phone_outlined, title: 'Phone', value: widget.info.phone),
      _dashLineDivider(),
      space(height: 12),
      _renderListTitle('Price Details'),
      ..._priceDetails()
    ];
  }

  List<Widget> _priceDetails() {
    List<Widget> items = [];
    widget.info.priceDetails.forEach((key, value) {
      items.add(_renderValuePair(label: key, value: value));
    });
    return items;
  }

  Widget _renderValuePair(
      {required String label, required String value, TextStyle? labelStyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: labelStyle,
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _dashLineDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: DashedLineDivider(),
    );
  }

  Widget _renderListedItemInfo(
      {required IconData icon, required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.grey),
          space(width: 12),
          Text(title),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Future<void> _selectPromoCode() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) =>
            PromoCodeSelectorPage(promoCodes: viewModel.promoCodes));
  }
}
