import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/model/room_model.dart';

class ItemRoomType extends StatelessWidget {
  final RoomModel model;
  final bool isSelected;
  final VoidCallback onPressed;
  const ItemRoomType(
      {super.key, required this.model, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    IconData icon =
        isSelected ? Icons.check_box : Icons.check_box_outline_blank;
    return Card(
      elevation: 0,
      color: Colors.transparent,
      
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.home_work_outlined),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            model.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(model.subtitle)
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    icon,
                    color: isSelected ? Colors.blue : Colors.grey,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
