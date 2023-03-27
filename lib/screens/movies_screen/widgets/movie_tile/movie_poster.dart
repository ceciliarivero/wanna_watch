import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  static const width = 87.0;
  static const height = 130.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4.0),
        bottomLeft: Radius.circular(4.0),
      ),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: imagePath,
        alignment: Alignment.topCenter,
        width: width,
        height: height,
        fit: BoxFit.contain,
        imageErrorBuilder: (_, __, ___) {
          return Container(
            width: width,
            height: height,
            color: theme.primaryColor,
            child: Center(
              child: Text(
                'Image not available',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ),
          );
        },
        fadeInDuration: const Duration(
          milliseconds: 300,
        ),
      ),
    );
  }
}
