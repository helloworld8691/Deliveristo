import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

extension StringExt on String {

  ClipRRect toNetworkImage({double? width, double? height, double borderRadius = 5, bool isFitCover = true, Function()? onTap, bool showLoadingIndicator = true}) => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    child: CachedNetworkImage(
      imageUrl: this,
      fit: BoxFit.cover, width: width, height: height,
      progressIndicatorBuilder: (context, url, downloadProgress) => showLoadingIndicator ? const Center(
        child: SizedBox(
            width: 20, height: 20,
            child: CircularProgressIndicator(strokeWidth: 2,)),
      ) : SizedBox(),
      errorWidget: (context, url, error) =>  Image(image: const AssetImage("assets/image/default_img.jpg"), width: width, height: height, fit: isFitCover ? BoxFit.cover : BoxFit.none),
    ),
  );

  ElevatedButton toButton(Function() onTap) => ElevatedButton(
      onPressed: onTap,
      child: Text(this));

  Text toText({double fontSize = 16, TextAlign textAlign = TextAlign.start, Color color = Colors.black, bool isBold = false}) {
    return Text(
      this,
      style: TextStyle(color: color, fontSize:  fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}