import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });
  final double height;
  final double width;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width,
        height: height,
        fit: BoxFit.fill,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(color: AppColors.secondary),
        ),
        errorWidget: (context, url, error) =>
            Center(child: Icon(Icons.error, color: AppColors.secondary)),
      ),
    );
  }
}
