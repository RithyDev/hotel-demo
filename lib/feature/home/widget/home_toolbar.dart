import 'package:flutter/material.dart';

class HomeToolbar extends StatelessWidget {
  const HomeToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(bottom: false, child: _renderContainer());
  }

  Widget _renderContainer() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_renderCityInfo(), _renderActions()],
      ),
    );
  }

  Widget _renderActions() {
    return Row(
      children: [
        const Icon(Icons.sms_outlined),
        const SizedBox(
          width: 12,
        ),
        _renderNotification(),
      ],
    );
  }

  Widget _renderNotification() {
    return const Stack(
      children: [
        Icon(Icons.notifications_outlined),
        Positioned(
            right: 2,
            top: 4,
            child: Icon(Icons.circle, size: 8, color: Colors.red))
      ],
    );
  }

  Widget _renderCityInfo() {
    
    return Card(
      color: Colors.grey.withOpacity(0.05),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Phone Penh, Cambodia',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
