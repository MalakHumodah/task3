import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageDecoration(String imageUrl, double height, double width) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    imageBuilder: (context, image) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
      );
    },
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
