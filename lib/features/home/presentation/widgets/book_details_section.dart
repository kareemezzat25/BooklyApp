import 'package:bookly_app/core/resources/app_assets.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_buttons.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookImage(height: 320, width: 200, image: AppAssets.testImage3),
        SizedBox(height: 42),
        Text("The Jungle Book", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 6),
        Text(
          "rubybidra kilpling",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 18),
        Center(child: BookRating()),
        SizedBox(height: 36),
        BookDetailsButtons(),
      ],
    );
  }
}
