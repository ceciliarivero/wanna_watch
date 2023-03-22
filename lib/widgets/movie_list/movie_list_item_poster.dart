import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListItemPoster extends StatelessWidget {
  final String imageUrl;

  const MovieListItemPoster({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4.0),
        bottomLeft: Radius.circular(4.0),
      ),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: imageUrl,
        alignment: Alignment.topCenter,
        width: 87,
        height: 130,
        fit: BoxFit.contain,
        imageErrorBuilder: (_, __, ___) {
          return Container(
            width: 87,
            height: 130,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Image not available',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
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
