import 'package:flutter/material.dart';
import 'package:hotel_app/widget/common_widget.dart';

class AppNetworkImage extends StatelessWidget {
  final String? source;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppNetworkImage(
      {super.key, this.source, this.height, this.width, this.fit});

  //todo use cache network image
  @override
  Widget build(BuildContext context) {
    var content = switch (source != null) {
      true => _renderImage(),
      _ => space()
    };
    return Container(
        color: Colors.grey.withOpacity(0.2),
        width: width,
        height: height,
        child: content);
  }

  Widget _renderImage() {
    return Image.network(
      source!,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null ? child : _renderLoading(),
    );
  }

  Widget _renderLoading() => const Center(
          child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        color: Colors.grey,
      ));

  bool isValidImageUrl(String url) {
    // Regular expression to match image URLs
    final RegExp regExp = RegExp(
      r'^https?:\/\/.*\.(?:png|jpg|jpeg|gif|bmp)$',
      caseSensitive: false,
    );

    // Check if the URL matches the regular expression
    return regExp.hasMatch(url);
  }
}
