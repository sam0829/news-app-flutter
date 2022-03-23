import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final BoxFit? fit;
  final double? width;

  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.fit,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(),
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
