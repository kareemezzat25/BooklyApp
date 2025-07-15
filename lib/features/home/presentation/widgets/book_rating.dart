import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:bookly_app/features/home/models/book_rating_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final BookRatingModel? bookRating;
  const BookRating({super.key, required this.bookRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.star, color: AppColors.starColor),
        SizedBox(width: 6),
        Text(
          "${bookRating?.ratingAverage ?? 0}",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 6),
        Text(
          "(${bookRating?.ratingCount ?? 0})",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: AppColors.textColor),
        ),
      ],
    );
  }
}
