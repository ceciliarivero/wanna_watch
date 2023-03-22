import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../shared/error.dart';

class MovieBackdrop extends StatelessWidget {
  final String imageUrl;

  const MovieBackdrop({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: imageUrl,
      fadeInDuration: const Duration(
        milliseconds: 300,
      ),
      height: 250,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      imageErrorBuilder: (_, __, ___) {
        return const SizedBox(
          height: 250,
          child: Error(text: 'Image not available'),
        );
      },
    );
  }
}
