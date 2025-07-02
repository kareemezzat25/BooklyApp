import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(FontAwesomeIcons.star, color: AppColors.starColor),
        SizedBox(width: 6),
        Text(
          "4.8",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 6),
        Text("(2430)", style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
