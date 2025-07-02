import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  SimilarBooksSection({super.key});

  final List<String> images = [
    AppAssets.testImage,
    AppAssets.testImage2,
    AppAssets.testImage3,
    AppAssets.testImage4,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BookImage(height: 160, width: 120, image: images[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 16);
        },
        itemCount: images.length,
      ),
    );
  }
}
