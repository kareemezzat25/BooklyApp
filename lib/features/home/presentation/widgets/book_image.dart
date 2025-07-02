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
      child: Image.asset(image, width: width, height: height, fit: BoxFit.fill),
    );
  }
}
