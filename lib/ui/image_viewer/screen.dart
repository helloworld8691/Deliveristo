import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

@RoutePage()
class ImageViewScreen extends StatelessWidget {
  final String url;
  const ImageViewScreen(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        imageProvider: CachedNetworkImageProvider(url),
      ),
    );
  }
}
