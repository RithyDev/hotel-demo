import 'package:flutter/material.dart';
import 'package:hotel_app/widget/app_network_image.dart';
import 'package:hotel_app/widget/common_widget.dart';

class ItemHotelReview extends StatelessWidget {
  const ItemHotelReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderReviwerProfile(),
          _renderReviewContent(),
          _renderStarCount()
        ],
      ),
    );
  }

  Widget _renderStarCount() {
    return const Row(
      children: [
        Icon(
          Icons.star_rounded,
          size: 18,
          color: Colors.amber,
        ),
        Text('4.5',style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _renderReviewContent() {
    String review =
        "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.";
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Jonathan',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          space(height: 8),
          Opacity(
              opacity: 0.6,
              child: Text(review,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis))
        ],
      ),
    ));
  }

  Widget _renderReviwerProfile() {
    double size = 50;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: AppNetworkImage(
        source:
            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600',
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
