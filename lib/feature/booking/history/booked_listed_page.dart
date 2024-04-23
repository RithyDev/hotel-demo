import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/history/booking_hotel_viewmodel.dart';
import 'package:hotel_app/feature/booking/history/widget/item_hotel_booking.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/widget/animated_dynamic_content.dart';
import 'package:hotel_app/widget/common_widget.dart';
import 'package:provider/provider.dart';

class BookedListedPage extends StatefulWidget {
  const BookedListedPage({super.key});

  @override
  State<BookedListedPage> createState() => _BookedListedPageState();
}

class _BookedListedPageState extends State<BookedListedPage> {
  late BookingHistoryViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BookingHistoryViewModel.createNewInstance();
    
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<BookingHistoryViewModel>(
            builder: (context, value, child) => _renderContent()));
  }

  Widget _renderContent() {
    return Container(
      child: _listState()
    );
  }

  Widget _listState() {
    var stream = viewModel.bookedLising;
    Widget content = switch(stream?.state) {
      AsyncState.loading  => Text('loading'),
      AsyncState.success => _renderListView(),
      _ => space()
    };
    
    return AppAnimatedDynamicContent(
      keyState: '${stream?.state}',
      child: content,
    );
  }

  Widget _renderListView() {
    var items = viewModel.bookedLising?.data??[];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: ItemBookedHotel(model: items[index]),
      ),
    );
  }
}
