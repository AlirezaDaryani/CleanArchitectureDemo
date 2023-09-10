import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatelessWidget {
  final String imageURL;

  const PhotoDetailScreen({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Big photo'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageURL,
          errorWidget: (context, url, error) => Image.asset(
            'assets/nasa_logo.jpg',
            width: 60,
            height: 60,
          ),
          progressIndicatorBuilder: (context, url, progress) =>
              const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
