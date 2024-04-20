import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/model/room_info.dart';
import 'package:hotel_app/feature/booking/widget/item_number_controller.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/common_widget.dart';

class RoomAndGuestController extends StatefulWidget {
  final BookingRoomInfo? initialInfo;

  const RoomAndGuestController({super.key, this.initialInfo});

  @override
  State<RoomAndGuestController> createState() => _RoomAndGuestControllerState();
}

class _RoomAndGuestControllerState extends State<RoomAndGuestController> {
  late BookingRoomInfo model;

  @override
  void initState() {
    super.initState();
    model =
        widget.initialInfo ?? BookingRoomInfo(room: 0, adults: 0, children: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: _renderTitle(),
              ),
              ItemNumberController(
                  title: 'Room', subtitle: 'Minimum contains 4 people'),
              ItemNumberController(title: 'Adults', subtitle: 'Age 15+'),
              ItemNumberController(
                  title: 'Children',
                  subtitle: 'Age 1 - 12',
                  showLineDivider: false),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child:
                appRoundedButton(context, onPressed: () => {}, title: 'Save'),
          )
        ],
      ),
    );
  }

  Widget _renderTitle() {
    return Text('Room and Guests',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }
}
