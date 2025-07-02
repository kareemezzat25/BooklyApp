import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderBooks extends StatelessWidget {
  CarouselSliderBooks({super.key});
  final List<String> images = [
    AppAssets.testImage,
    AppAssets.testImage2,
    AppAssets.testImage3,
    AppAssets.testImage4,
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280.0,
        autoPlay: true,
        viewportFraction: 0.48,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: Duration(milliseconds: 600),
      ),

      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return BookImage(height: 280, width: 180, image: i);
          },
        );
      }).toList(),
    );
  }
}
