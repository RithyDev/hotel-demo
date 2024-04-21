import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/model/room_info.dart';
import 'package:hotel_app/feature/booking/widget/item_number_controller.dart';
import 'package:hotel_app/widget/app_button_styles.dart';

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
              _renderRoomCounter(),
              _renderAdultsCounter(),
              _renderChildrenCounter(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: appRoundedButton(context,
                onPressed: _onSavePressed,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          )
        ],
      ),
    );
  }

  Widget _renderChildrenCounter() {
    return ItemNumberController(
        value: model.children,
        title: 'Children',
        subtitle: 'Age 1 - 12',
        onActionPressed: _handleOnChildrenCountAction,
        showLineDivider: false);
  }

  void _handleOnChildrenCountAction(int mode) {
    setState(() {
      if (mode == 1) {
        model.increaseChildren();
      } else if (mode == -1) {
        model.decreaseChildren();
      }
    });
  }

  Widget _renderAdultsCounter() {
    return ItemNumberController(
      title: 'Adults',
      subtitle: 'Age 15+',
      value: model.adults,
      onActionPressed: _handleOnAdultsCountAction,
    );
  }

  void _handleOnAdultsCountAction(int mode) {
    setState(() {
      if (mode == 1) {
        model.increaseAdults();
      } else if (mode == -1) {
        model.decreaseAdults();
      }
    });
  }

  Widget _renderRoomCounter() {
    return ItemNumberController(
        value: model.room,
        onActionPressed: (mode) {
          setState(() {
            if (mode == 1) {
              model.increaseRoom();
            } else if (mode == -1) {
              model.decreaseRoom();
            }
          });
        },
        title: 'Room',
        subtitle: 'Minimum contains 4 people');
  }

  Widget _renderTitle() {
    return const Text('Room and Guests',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }

  void _onSavePressed() {
    Navigator.of(context).pop(model);
  }
}
