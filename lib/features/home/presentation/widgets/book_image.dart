import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: Image.asset(
        AppAssets.testImage3,
        width: 200,
        height: 320,
        fit: BoxFit.fill,
      ),
    );
  }
}
