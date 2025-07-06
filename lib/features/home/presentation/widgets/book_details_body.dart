import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BookDetailsSection(),
            SizedBox(height: 36),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "You can also like",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ),
            SizedBox(height: 16),
            SimilarBooksSection(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
