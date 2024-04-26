import 'package:flutter/material.dart';
import 'package:hotel_app/widget/common_widget.dart';

class HotelCommonFacilities extends StatelessWidget {
  const HotelCommonFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_renderActions(), _renderListInfo(context)],
      ),
    );
  }

  Widget _renderListInfo(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderFacilitiesInfo(context, icon: Icons.air_outlined, title: 'Ac\n', parentWidth: box.maxWidth),
            _renderFacilitiesInfo(context,
                icon: Icons.restaurant_menu_outlined, title: 'Restaurant\n', parentWidth: box.maxWidth),
            _renderFacilitiesInfo(context,
                icon: Icons.pool_outlined, title: 'Swiming\nPool', parentWidth: box.maxWidth),
            _renderFacilitiesInfo(context,
                icon: Icons.event_note_outlined, title: '24-Hours\nFlont Desk', parentWidth: box.maxWidth)
          ],
        );
      }
    );
  }

  Widget _renderActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _renderTitle(),
        TextButton(onPressed: () {}, child: const Text('See All')),
      ],
    );
  }

  Text _renderTitle() {
    return const Text(
      'Common Facillities',
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    );
  }

  Widget _renderFacilitiesInfo(BuildContext context,
      {required IconData icon, required String title, required double parentWidth}) {
    // var size = MediaQuery.of(context).size;
    var p = 16;
    double itemSize = (parentWidth / 4) - p * 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _renderIconMainContainer(itemSize, icon),
        space(height: 4),
        _renderInfoTitle(title),
      ],
    );
  }

  Widget _renderInfoTitle(String title) {
    return Opacity(
      opacity: 0.8,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Container _renderIconMainContainer(double itemSize, IconData icon) {
    return Container(
        width: itemSize,
        height: itemSize,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.06),
            borderRadius: BorderRadius.circular(itemSize / 2)),
        child:
            Icon(icon, size: 32, color: const Color.fromARGB(255, 54, 54, 54)));
  }
}
