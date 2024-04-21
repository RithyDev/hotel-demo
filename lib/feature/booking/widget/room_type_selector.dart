import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/booking/model/room_model.dart';
import 'package:hotel_app/feature/booking/widget/item_room_type.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/common_widget.dart';

class RoomTypeSelector extends StatefulWidget {
  final String? initialSelectedId;
  final List<RoomModel> roomTypes;
  const RoomTypeSelector(
      {super.key, this.initialSelectedId, required this.roomTypes});

  @override
  State<RoomTypeSelector> createState() => _RoomTypeSelectorState();
}

class _RoomTypeSelectorState extends State<RoomTypeSelector> {
  String? selectedRoomId;

  @override
  void initState() {
    super.initState();
    selectedRoomId = widget.initialSelectedId;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderTitle(),
        _renderSearchBox(),
        space(height: 12),
        _renderListTitle(),
        _renderRoomList(),
        _renderSaveButton(context)
      ],
    );
  }

  Padding _renderSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: appRoundedButton(context,
          onPressed: _onSavePressed,
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Padding _renderListTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        'Room List (2)',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }

  Padding _renderTitle() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Text(
        'Room Type',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _renderRoomList() {
    return Expanded(child: _renderListBuilder());
  }

  Widget _renderListBuilder() {
    return ListView.builder(
      itemCount: widget.roomTypes.length,
      itemBuilder: (context, index) => _renderRoomListedItem(index),
    );
  }

  Widget _renderRoomListedItem(int index) {
    var itemModel = widget.roomTypes[index];
    return ItemRoomType(
      isSelected: selectedRoomId == itemModel.roomId,
      model: itemModel,
      onPressed: () {
        setState(() {
          selectedRoomId = itemModel.roomId;
        });
      },
    );
  }

  Widget _renderSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Search your type'),
            )),
            SvgPicture.asset(
              ImageSource.icPageInfo,
              width: 24,
              height: 24,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  void _onSavePressed() {
    RoomModel? result;
    if (selectedRoomId != null) {
      result = widget.roomTypes
          .where((element) => element.roomId == selectedRoomId)
          .firstOrNull;
    }
    Navigator.of(context).pop(result);
  }
}
