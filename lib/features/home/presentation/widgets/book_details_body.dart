import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/features/home/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/cubits/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsBody extends StatefulWidget {
  final Items? bookItems;
  const BookDetailsBody({super.key, this.bookItems});

  @override
  State<BookDetailsBody> createState() => _BookDetailsBodyState();
}

class _BookDetailsBodyState extends State<BookDetailsBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final category = widget.bookItems?.volumeInfo?.categories?.first;
      if (category != null && category.isNotEmpty) {
        BlocProvider.of<SimilarBooksCubit>(
          context,
        ).fetchSimilarBooks(category: category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BookDetailsSection(bookItems: widget.bookItems!),
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
