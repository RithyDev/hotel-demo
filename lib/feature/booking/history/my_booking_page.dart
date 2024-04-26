import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/history/booked_listed_page.dart';
import 'package:hotel_app/feature/booking/history/tab_segment.dart';
import 'package:hotel_app/widget/app_toolbar.dart';

@RoutePage()
class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [_renderToolbar(), _renderMainContent()],
          )),
    );
  }

  Widget _renderToolbar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: AppToolbar(
        title: 'My Booking',
        enabledBackPressed: false,
        actions: [Icon(Icons.filter_list_outlined)],
      ),
    );
  }

  Widget _renderMainContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_tapbar(), _pageContainer()],
      ),
    );
  }

  Expanded _pageContainer() {
    return Expanded(
      child: Container(
        child: const BookedListedPage(),
      ),
    );
  }

  Widget _tapbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: _renderTabs(),
    );
  }

  Widget _renderTabs() => const TabSegment();
}
