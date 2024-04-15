import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/resource/image_resource.dart';

class HomePageHeadlineInfo extends StatelessWidget {
  const HomePageHeadlineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _textGreetingUser(),
          const SizedBox(height: 6),
          _textSearchDescription(),
          const SizedBox(height: 12),
          _renderSearchButton()
        ],
      ),
    );
  }

  Widget _textGreetingUser() {
    return const Text(
      'Hello, Jonatan 👋',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _renderSearchButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: _searchButtonDecor(),
      child: _searchButtonContent(),
    );
  }

  Widget _searchButtonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _wrapByOpacity(
                opacity: 0.4, child: const Icon(Icons.search_outlined)),
            const SizedBox(width: 12),
            _searchButtonTitle(),
          ],
        ),
        _wrapByOpacity(
          opacity: 0.4,
          child: SvgPicture.asset(
            ImageSource.icPageInfo,
            width: 24,
            height: 24,
          ),
        )
      ],
    );
  }

  Widget _searchButtonTitle() {
    return const Text(
      'Search your hotels',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    );
  }

  BoxDecoration _searchButtonDecor() {
    return BoxDecoration(
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(22));
  }

  Widget _wrapByOpacity({required Widget child, required double opacity}) =>
      Opacity(opacity: opacity, child: child);

  Widget _textSearchDescription() {
    return const Text(
      "Let's find the best hotels\naround the world",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
